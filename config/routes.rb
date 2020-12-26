# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'minpaku#index'

  get 'survey' => 'survey#index'
  post 'survey/answer' => 'survey#answer'
end
