Rails.application.routes.draw do
  root to: "chord_charts#index"
  get "/results", to: "chord_charts#results"
end
