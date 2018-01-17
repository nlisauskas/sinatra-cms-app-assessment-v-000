class CreateVisitorCountrys < ActiveRecord::Migration
  def change
    create_table :visitor_countrys do |t|
      t.integer :visitor_id
      t.integer :country_id
    end
  end
end
