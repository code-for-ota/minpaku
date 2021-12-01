# frozen_string_literal: true

class MinpakuController < ApplicationController
  #after_action :allow_iframe, only: [:index, :get_aggregate_values, :get_comments]

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

  private
  def allow_iframe
    url="http://codeforota.tokyo"
    response.headers['X-Frame-Options'] = "ALLOW-FROM #{url}"
    response.headers['Content-Security-Policy'] = "frame-ancestors #{url}"
  end
end
