ActiveRecord::Schema.define do
  self.verbose = false

  create_table :products, primary_key: 'product_id', force: true do |t|
    t.string :name
    t.string :description
    t.integer :stock
  end
end
