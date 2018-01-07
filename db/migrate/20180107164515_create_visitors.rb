class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
