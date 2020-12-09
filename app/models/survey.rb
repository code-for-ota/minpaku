# frozen_string_literal: true

class Survey < ApplicationRecord
  belongs_to :minpaku
  has_one :survey_comment
  has_many :survey_values
end
