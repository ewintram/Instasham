Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'devise/sessions' }
  get 'posts/index'

  root 'posts#index'

  resources :posts do
    resources :comments
    member do
      put "like" => "posts#vote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
