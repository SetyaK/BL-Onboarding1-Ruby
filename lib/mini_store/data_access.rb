require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: ENV['MS_DB_ADAPTER'],
  host: ENV['MS_DB_HOST'],
  username: ENV['MS_DB_USERNAME'],
  password: ENV['MS_DB_PASSWORD'],
  database: ENV['MS_DB_CATALOG']
)

# Products active record
class Product < ActiveRecord::Base
  self.primary_key = 'product_id'
end
