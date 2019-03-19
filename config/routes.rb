Rails.application.routes.draw do
  get 'nittei/find'
  get 'standing/find'
  get 'recruit_umpire' => 'recruit_umpire#show'
  get 'team' => 'team#show'
  get 'top' => 'top#show'
  get 'nittei' => 'nittei#show'
  get 'standing' => 'standing#show'
  get 'admin' => 'admin#top'
  get 'login' => 'login#index'
  post 'login' => 'login#auth'
  post 'logout' => 'login#logout'

  root to: 'top#show'

  resources :award_players do
    member do
      get :new_award_player
    end
  end

  resources :award_infos, except: [:show] do
    member do
      get :award_players_management
    end

    collection do
      get :management
      get :find
    end
  end

  resources :event_one_days do
    member do
      get :new_one_day
    end
  end

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
      get :narrow
    end

    member do
      get :score
    end
  end

end