Rails.application.routes.draw do
  root 'high_voltage/pages#show', id: 'intro'

  # redirect legacy routes
  get '/view/:type', to: redirect { |path_params, _req| "/sites/#{path_params[:type]}" }
  get '/sites/(:type)', to: 'sites#index', as: :sites
end
