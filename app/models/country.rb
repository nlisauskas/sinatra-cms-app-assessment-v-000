class Country < ActiveRecord::Base
  has_many :visitor_countrys
  has_many :visitors, through: :visitor_countrys
  has_many :cities


end
