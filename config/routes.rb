Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :flooring_partner_searches, only: [:index, :show]
      end
    end
 end
end
