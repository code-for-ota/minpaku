# frozen_string_literal: true

class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.references :minpaku, foreign_key: true

      t.timestamps
    end
  end
end
