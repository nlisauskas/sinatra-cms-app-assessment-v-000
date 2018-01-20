class City < ActiveRecord::Base
  belongs_to :country
  has_many :visitor_cities
  has_many :visitors, through: :visitor_cities
end
