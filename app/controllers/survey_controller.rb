class SurveyController < ApplicationController
    def index
        @minpaku = Minpaku.find(params[:minpaku_id])
        @survey_list = SurveyList.all
    end

    def answer
        minpaku_id = params[:minpaku_id]
        survey_list = SurveyList.all

        survey = Survey.create!(minpaku_id: minpaku_id)

        survey_list.each do |survey_content|
            id = survey_content.id
            SurveyValue.create!(survey_id: survey.id, value: params["survey_#{id}"], survey_list_id: id)
        end

        SurveyComment.create(survey_id: survey.id, comment: params[:survey_comment])

        redirect_to root_path
    end
end
