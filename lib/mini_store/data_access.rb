require 'active_record'

ENV['MS_DB_ADAPTER'] = 'sqlite3' if ENV['MS_DB_ADAPTER'].nil?
ENV['MS_DB_CATALOG'] = ':memory:' if ENV['MS_DB_CATALOG'].nil?

ActiveRecord::Base.establish_connection(
  adapter: ENV['MS_DB_ADAPTER'],
  host: ENV['MS_DB_HOST'],
  username: ENV['MS_DB_USERNAME'],
  password: ENV['MS_DB_PASSWORD'],
  database: ENV['MS_DB_CATALOG']
)

require_relative 'schema.rb' if ENV['MS_DB_INIT_SCHEMA'] == 'true'

# Products active record
class Product < ActiveRecord::Base
  self.primary_key = 'product_id'
end
