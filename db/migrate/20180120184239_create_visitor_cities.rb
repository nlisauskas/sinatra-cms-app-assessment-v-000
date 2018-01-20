
class CreateVisitorCities < ActiveRecord::Migration
  def change
    create_table :visitor_cities do |t|
      t.integer :visitor_id
      t.integer :city_id
    end
  end
end
