Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :flooring_partners, only: [:index, :show]
      end
    end
 end
end
