# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

survey_list = [
  { survey_name: '清潔さ・ゴミ管理' },
  { survey_name: '騒音対策' },
  { survey_name: '管理者の対応' },
  { survey_name: '防災' },
  { survey_name: '防犯' }
]
SurveyList.create(survey_list)