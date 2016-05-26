Rails.application.routes.draw do
  root 'high_voltage/pages#show', id: 'intro'
  get '/view/:type' => 'sites#index', as: :site_index
end
