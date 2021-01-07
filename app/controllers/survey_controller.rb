class SurveyController < ApplicationController
    def index
        @minpaku_id = params[:minpaku_id]
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

        redirect_to root_path
    end
end
