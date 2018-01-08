class VisitorCountry < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :country
end
