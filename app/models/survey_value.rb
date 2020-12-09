# frozen_string_literal: true

class SurveyValue < ApplicationRecord
  belongs_to :survey
  belongs_to :survey_list
end
