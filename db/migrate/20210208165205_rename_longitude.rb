class RenameLongitude < ActiveRecord::Migration[6.0]
  def change
    rename_column :minpakus, :longtitude, :longitude
  end
end
