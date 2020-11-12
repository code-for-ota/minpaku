# frozen_string_literal: true

class CreateSurveyComments < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_comments do |t|
      t.string :comment
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
