class Country < ActiveRecord::Base
  has_many :visitors
  has_many :beverages
end
