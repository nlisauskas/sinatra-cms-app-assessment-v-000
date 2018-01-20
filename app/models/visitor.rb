class Visitor < ActiveRecord::Base
  has_many :visitor_countrys
  has_many :countrys, through: :visitor_countrys
  has_many :visitor_cities
  has_many :cities, through: :visitor_cities

  has_secure_password
end
