class VisitorCity < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :city
end
