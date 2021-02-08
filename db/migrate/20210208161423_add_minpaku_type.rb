class AddMinpakuType < ActiveRecord::Migration[6.0]
  def change
    add_column :minpakus, :type, :string
  end
end
