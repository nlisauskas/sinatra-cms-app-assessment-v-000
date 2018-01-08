class Visitor < ActiveRecord::Base
  has_many :visitor_countrys
  has_many :countrys, through: :visitor_countrys
  has_many :beverages

  has_secure_password
end
