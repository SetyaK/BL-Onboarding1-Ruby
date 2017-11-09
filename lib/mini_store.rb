require 'mini_store/data_access.rb'

# The main store driver
class MiniStore
  def self.init_schema
    require 'mini_store/schema.rb'
  end

  def self.products
    Product.all
  end

  def self.products_count
    Product.count
  end

  def self.product(id)
    begin
      product = Product.find(id)
    rescue ActiveRecord::RecordNotFound
      product = nil
    end
    product
  end

  def self.add_product(name, description, initial_stock)
    product = Product.new(name: name, description: description,
                          stock: initial_stock)
    result = product.save
    if result
      product
    else
      false
    end
  end

  def self.remove_product(id)
    if Product.destroy(id)
      true
    else
      false
    end
  rescue ActiveRecord::RecordNotFound
    false
  end

  def self.update_product(id, name, description)
    product = self.product(id)
    if product.nil?
      false
    else
      product.name = name
      product.description = description
      product.save
    end
  end
end
