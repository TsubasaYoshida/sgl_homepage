Rails.application.routes.draw do
  root to: 'top#show'
  get 'top/show'
  get 'admin/top'
  get 'nittei/show'
  get 'nittei/find'
  get 'standing/show'
  get 'standing/find'

  resources :event_one_days

  resources :event_infos do
    member do
      get :one_days_management
    end
  end

  resources :infos do
    collection do
      get :management
    end
  end

  resources :game_infos do
    collection do
      get :management
    end

    member do
      get :score
    end
  end

end
