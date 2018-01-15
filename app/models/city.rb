class City < ActiveRecord::Base
  has_many :visitors
  belongs_to :country
end
