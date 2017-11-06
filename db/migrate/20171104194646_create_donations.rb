class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.integer :counter

      t.timestamps null: false
    end
  end
end
