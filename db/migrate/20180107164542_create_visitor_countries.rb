class CreateVisitorCountries < ActiveRecord::Migration
  def change
    create_table :visitor_countries do |t|
      t.integer :visitor_id
      t.integer :country_id
  end
  end
end
