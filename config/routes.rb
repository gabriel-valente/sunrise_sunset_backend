Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/sun_data", to: "sun_data#index"
end
