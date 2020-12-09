# frozen_string_literal: true

class SurveyList < ApplicationRecord
  has_many :survey_values
end
