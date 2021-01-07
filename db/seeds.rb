# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create(username: 'test', password: 'test')

survey_list = [
  { survey_name: '清潔さ・ゴミ管理' },
  { survey_name: '騒音' },
  { survey_name: '管理者' },
  { survey_name: '防災' },
  { survey_name: '防犯' }
]
SurveyList.create(survey_list)

minpaku_list = [{
  name: '民泊A',
  longtitude: '139.73926908273415',
  latitude: '35.6293681',
  postal_code: '108-8282',
  prefecture: '東京都',
  city: '港区',
  address_details: '高輪３丁目２６−２７'
},{
  name: '民泊B',
  longtitude: '139.6655074',
  latitude: '35.6257156',
  postal_code: '108-8282',
  prefecture: '東京都',
  city: '目黒区',
  address_details: '東が丘２丁目５'
}]

minpaku = Minpaku.create(minpaku_list)
minpaku[0].survey_comments.create(comment: 'aaaaaaaaaaaaaaaaaaa')
minpaku[1].survey_comments.create(comment: 'bbbbbbbbbbbbbbbbbbbb')

survey_ids = SurveyList.all.pluck(:id)
survey_ids.each do |id|
  minpaku[0].survey_values.create(survey_list_id: id, value: [0, 1].sample)
  minpaku[1].survey_values.create(survey_list_id: id, value: [0, 1].sample)
end
