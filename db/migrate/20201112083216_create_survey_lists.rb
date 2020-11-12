class CreateSurveyLists < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_lists do |t|
      t.string :survey_name

      t.timestamps
    end
  end
end
