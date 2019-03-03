Rails.application.routes.draw do
  get 'recruit_umpire/show'
  get 'team/show'
  get 'top/show'
  get 'admin/top'
  get 'award/show'
  get 'award/find'
  get 'nittei/show'
  get 'nittei/find'
  get 'standing/show'
  get 'standing/find'
  get 'login/index'
  post 'login/auth'

  # ログイン失敗時にリロードされた場合の対策
  get 'login/auth' => 'login#index'

  root to: 'top#show'

  resources :award_players do
    member do
      get :new_award_player
    end
  end

  resources :award_infos do
    member do
      get :award_players_management
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
