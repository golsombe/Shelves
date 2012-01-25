#require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Products
  include DataMapper::Resource  
  property :id,           Serial
  property :sku, 	String
  property :name,         String
  property :description,	String
  property :unit_price, Float
  property :wholesale_price, Float
  property :completed_at, 	DateTime

  has 1 :Categories
  has 1 :Sub_Categories
end

class Categories
  include DataMapper::Resource
  property :id,	Serial
  property :name, String
  property	:description,	String
  property :completed_at, DateTime
  
  has n :Products
end

class Sub_Categories
   include DataMapper::Resource
   property :id,	Serial
   property :category_id, Integer
   property :name, String
   property :description, String
   property :completed_at, DateTime
   
   has n :Products
end

class Iventory
   include DataMapper::Resource
   property :id, Serial
   property :product_id, Integer
   property :qty, Integer
   property :last_purchased, Date
   property :last_ordered, Date
   property :updated_at, DateTime
end

DataMapper.auto_upgrade!