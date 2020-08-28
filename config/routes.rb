Rails.application.routes.draw do
  get 'infos/page(/:id)' => 'infos#page'
  get 'nittei/find'
  get 'recruit_umpire' => 'recruit_umpire#show'
  get 'team' => 'team#show'
  get 'top' => 'top#show'
  get 'nittei' => 'nittei#show'
  get 'standings' => 'standings#index'
  get 'admin' => 'admin#top'
  get 'stop_covid19' => 'static_pages#stop_covid19'
  get 'special_rules_2020_autumn' => 'static_pages#special_rules_2020_autumn'
  get 'articles/1' => 'static_pages#replacement_battle_2020_autumn'

  get 'login' => 'login#index'
  post 'login' => 'login#auth'
  post 'logout' => 'login#logout'

  resources :championships, only: [:index, :new, :edit, :create, :update, :destroy] do
    collection do
      get :management
    end
    resources :championship_games, only: [:new, :edit, :create, :update, :destroy] do
      collection do
        get :management
      end
      member do
        get :edit_game
        get :score
      end
    end
    resources :championship_awards, only: [:new, :edit, :create, :update, :destroy] do
      collection do
        get :management
      end
    end
  end

  resources :award_players, except: [:index, :show] do
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

  resources :infos, except: [:show] do
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

  root to: 'top#show'

end
