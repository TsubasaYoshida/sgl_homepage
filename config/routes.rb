Rails.application.routes.draw do
  resources :event_one_days
  resources :event_infos
  get 'admin/top'
  get 'nittei/show'
  get 'nittei/find'
  get 'standing/show'
  get 'top/show'

  resources :nittei_infos

  resources :infos

  resources :game_infos do
    collection do
      get :management
    end

    member do
      get :score
    end
  end

  root to: 'top#show'
end
