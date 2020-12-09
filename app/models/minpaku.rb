# frozen_string_literal: true

class Minpaku < ApplicationRecord
  has_many :surveys
  has_many :survey_comments, through: :surveys
  has_many :survey_values, through: :surveys
end
