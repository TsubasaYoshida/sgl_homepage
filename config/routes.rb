Rails.application.routes.draw do
  get 'team/show'
  get 'top/show'
  get 'admin/top'
  get 'award/show'
  get 'award/find'
  get 'nittei/show'
  get 'nittei/find'
  get 'standing/show'
  get 'standing/find'
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
    end

    member do
      get :score
    end
  end

end
