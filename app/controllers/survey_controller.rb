class SurveyController < ApplicationController
    def index
        @minpaku_id = params[:minpaku_id]
        @survey_list = SurveyList.all
    end

    def answer
        survey = Survey.create!(minpaku_id: 1)

        # 要修正
        survey_1 = SurveyValue.create!(survey_id: survey.id, value: params[:survey_1], survey_list_id: 1)
        survey_2 = SurveyValue.create(survey_id: survey.id, value: params[:survey_2], survey_list_id: 2)
        survey_3 = SurveyValue.create(survey_id: survey.id, value: params[:survey_3], survey_list_id: 3)
        survey_4 = SurveyValue.create(survey_id: survey.id, value: params[:survey_4], survey_list_id: 4)
        survey_5 = SurveyValue.create(survey_id: survey.id, value: params[:survey_5], survey_list_id: 5)

        redirect_to root_path
    end
end
