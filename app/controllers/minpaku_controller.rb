# frozen_string_literal: true

class MinpakuController < ApplicationController
  def index
    @minpaku_list = Minpaku.all
    gon.minpaku_all = @minpaku_list
    @survey_list = SurveyList.all
  end
end
