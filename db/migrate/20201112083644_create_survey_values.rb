# frozen_string_literal: true

class CreateSurveyValues < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_values do |t|
      t.integer :value
      t.references :survey, foreign_key: true
      t.references :survey_list, foreign_key: true

      t.timestamps
    end
  end
end
