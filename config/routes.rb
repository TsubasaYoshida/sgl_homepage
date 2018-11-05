Rails.application.routes.draw do
  get 'nittei/show'
  get 'nittei/find'
  get 'standing/show'
  get 'top/show'

  resources :nittei_infos

  resources :infos

  resources :game_infos do
    member do
      get :score
    end
  end

  root to: 'top#show'
end
