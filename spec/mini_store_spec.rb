require 'simplecov'
SimpleCov.start

ENV['MS_DB_INIT_SCHEMA'] = 'true'
require 'mini_store'

describe MiniStore do
  describe '.add_product' do
    context 'given name = p1, description = d1, initial_stock = 1' do
      p = MiniStore.add_product('p1', 'd1', 1)
      it 'result to be kind of Product' do
        expect(p).to be_kind_of(Product)
      end
      it 'product_id to be > 0' do
        expect(p.product_id).to be > 0
      end
      it 'product name is p1' do
        expect(p.name).to eq('p1')
      end
      it 'product description is d1' do
        expect(p.description).to eq('d1')
      end
      it 'product stock = 1' do
        expect(p.stock).to eq(1)
      end
    end
  end

  describe '.product' do
    context 'given id=99' do
      p = MiniStore.product(99)
      it 'to be nil' do
        expect(p).to be_nil
      end
    end
    context 'given id=1' do
      p = MiniStore.product(1)
      it 'to be kind of Product' do
        expect(p).to be_kind_of(Product)
      end
      it 'product_id to be 1' do
        expect(p.product_id).to eq(1)
      end
    end
  end

  describe '.update_product' do
    context 'given product_id = 1, name = up1, description = ud1' do
      r = MiniStore.update_product(1, 'up1', 'ud1')
      p = MiniStore.product(1)
      it 'result to be true' do
        expect(r).to eq(true)
      end
      it 'product name changed to up1' do
        expect(p.name).to eq('up1')
      end
      it 'product description changed to ud1' do
        expect(p.description).to eq('ud1')
      end
      it 'product stock still 1' do
        expect(p.stock).to eq(1)
      end
    end
    context 'given product_id = 99' do
      r = MiniStore.update_product(99, '', '')
      it 'result to be false' do
        expect(r).to eq(false)
      end
    end
  end

  describe '.products_count' do
    it 'to be 1' do
      expect(MiniStore.products_count).to eq(1)
    end
  end

  describe '.products' do
    p = MiniStore.products
    it 'to be kind of ' do
      expect(p).to be_kind_of(ActiveRecord::Relation)
    end
    it 'size is 1 ' do
      expect(p.size).to eq(1)
    end
  end

  describe '.remove_product' do
    context 'given product_id = 99' do
      it 'to be false' do
        expect(MiniStore.remove_product(99)).to eq(false)
      end
    end
    context 'given product_id = 1' do
      it 'to be true' do
        expect(MiniStore.remove_product(1)).to eq(true)
      end
    end
  end
end
