# frozen_string_literal: true

class ChangeDdColumnsToMinpaku < ActiveRecord::Migration[6.0]
  def change
    add_column :minpakus, :latitude, :float
    add_column :minpakus, :longitude, :float
    remove_column :minpakus, :google_map_dd, :string
  end
end
