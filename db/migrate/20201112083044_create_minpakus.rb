class CreateMinpakus < ActiveRecord::Migration[6.0]
  def change
    create_table :minpakus do |t|
      t.string :name
      t.string :google_map_dd
      t.string :postal_code
      t.string :prefecture
      t.string :city
      t.string :address_details

      t.timestamps
    end
  end
end
