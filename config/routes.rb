Rails.application.routes.draw do
  root to: 'public/homes#top'


  # Devise routes
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  # Admin routes
  namespace :admin do
    root to: 'homes#top'

    resources :countries, only: [:index, :create, :destroy, :edit, :update]

    resources :companies, only: [:index, :create, :show, :edit, :update, :new]

    resources :genres, only: [:index, :create, :edit, :update, :destroy]

    resources :customers, only: [:index, :show, :update]

    resources :orders, only: [:index, :show, :update]

    resources :wines
  end

  # Public routes
  scope module: :public do
    get 'homes/about'

    resources :customers, only: [:show, :edit, :update] do
      collection do
        post 'confirm'
      end
      member do
        get 'information'
        patch 'withdrawl'
      end
    end

    resources :countries, only: [:show, :index]

    resources :companies, only: [:show, :index]

    resource :favorite_companies, only: [:create, :destroy]

    resources :deliveries, only: [:new, :index, :create, :edit, :update]

    resources :wines, only: [:show, :index] do
      resources :wine_comments, only: [:create, :destroy]
      resource :favorite_wines, only: [:create, :destroy]
    end

    resources :cart_items, only: [:index, :create, :update]

    resources :orders, only: [:index, :show, :new] do
      collection do
        get 'complete'
      end
      member do
        post 'confirm'
      end
    end

  end

end