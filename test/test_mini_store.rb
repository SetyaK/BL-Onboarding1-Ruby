ENV['MS_DB_ADAPTER'] = 'sqlite3'
ENV['MS_DB_CATALOG'] = ':memory:'

require 'minitest/autorun'
require 'mini_store'
require_relative '../lib/mini_store/schema'

class MiniStoreTest < Minitest::Test
  def test_products_count_is_integer
    assert_instance_of Integer, MiniStore.products_count
  end

  def test_add_product
    initial_products_count = MiniStore.products_count
    product_name = 'First Product'
    product_description = 'The first product ever'
    product_stock = 1
    insert_result = MiniStore.add_product(product_name,
                                          product_description, product_stock)
    expected_product_count = initial_products_count + 1

    # assert
    assert_instance_of Product, insert_result
    assert_equal product_name, insert_result.name
    assert_equal product_description, insert_result.description
    assert_equal product_stock, insert_result.stock
    assert_equal expected_product_count, MiniStore.products_count
  end

  def test_remove_products
    # insert first
    initial_products_count = MiniStore.products_count
    product = MiniStore.add_product('old product',
                                    'product to delete', 0)
    expected_product_count = initial_products_count + 1

    # assert after insert
    assert_instance_of Product, product
    assert_equal expected_product_count, MiniStore.products_count

    # remove
    remove_result = MiniStore.remove_product(product.id)
    expected_product_count -= 1

    # assert after delete
    assert_instance_of Product, remove_result
    assert_equal expected_product_count, MiniStore.products_count
  end

  def test_update_products
    product_name = 'The Product'
    product_description = 'The real product'
    product_stock = 1

    # insert first
    insert_result = MiniStore.add_product('', '', product_stock)

    # assert after insert
    assert_instance_of Product, insert_result

    # update
    update_result = MiniStore.update_product(insert_result.id,
                                             product_name, product_description)
    product = MiniStore.product(insert_result.id)

    # assert after update
    assert_equal true, update_result
    assert_equal product_name, product.name
    assert_equal product_description, product.description
    assert_equal product_stock, product.stock
  end
end
