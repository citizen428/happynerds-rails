Rails.application.routes.draw do
  root 'high_voltage/pages#show', id: 'intro'
  # redirect legacy routes
  get '/view/:type', to: redirect { |path_params, _req| "/sites?type=#{path_params[:type]}" }
  resources :sites, only: [:index, :new, :create]
end
