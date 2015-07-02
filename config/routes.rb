Rails.application.routes.draw do
  # root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :restaurants

      resources :users do
        resources :favorites
      end

    end
  end
end
