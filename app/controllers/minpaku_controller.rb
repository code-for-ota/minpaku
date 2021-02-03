# frozen_string_literal: true

class MinpakuController < ApplicationController
  def index
    @minpaku_list = Minpaku.all
    @survey_list = SurveyList.all
    
    gon.minpaku_all = @minpaku_list
  end

  def get_aggregate_values
    render :json => Minpaku.find(request[:id]).get_aggregate_values
  end

  def get_comments
    render :json => Minpaku.find(request[:id]).get_comments
  end
end
