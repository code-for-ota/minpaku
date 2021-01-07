# frozen_string_literal: true

class MinpakuController < ApplicationController
  def index
    @minpaku_list = Minpaku.all
  end
end
