class Visitor < ActiveRecord::Base

  has_many :countrys
  has_many :beverages

  has_secure_password
end
