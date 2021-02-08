# frozen_string_literal: true

class Minpaku < ApplicationRecord
  has_many :surveys
  has_many :survey_comments, through: :surveys
  has_many :survey_values, through: :surveys

  self.inheritance_column = :_type_disabled

  def set_aggregate_values
    self.aggregate_values = self.get_aggregate_values
  end

  def get_aggregate_values
    result = ActiveRecord::Base.connection.select_all("SELECT 
        AVG(minpaku_values.value) AS average,
        survey_lists.survey_name
      FROM
        survey_lists
        INNER JOIN
          (SELECT 
            survey_values.value,
            survey_values.survey_list_id,
            surveys.minpaku_id
          FROM
            survey_values
          INNER JOIN surveys ON survey_values.survey_id = surveys.id
          WHERE minpaku_id = #{self.id}) AS minpaku_values 
        ON survey_lists.id = minpaku_values.survey_list_id
        GROUP BY survey_lists.survey_name;
      ")
      return result
  end

  def get_comments
  end
end
