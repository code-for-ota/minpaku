# frozen_string_literal: true

class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
