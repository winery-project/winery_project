Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }


  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end

  namespace :admin do
    resources :countries, only: [:index, :create, :destroy, :edit, :update]
    resources :companies, only: [:index, :create, :show, :edit, :update, :new]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :wines, only: [:new, :show, :index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get '/' => 'homes#top'
  end

  namespace :public do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
  end
  namespace :public do
    get 'cart_items/index'
  end


  scope module: :public do
    get 'homes/top'
    get 'homes/about'

    resources :countries, only: [:show, :index]
    resources :companies, only: [:show, :index]
    resource :favorite_companies, only: [:create, :destroy]
    resources :deliveries, only: [:new, :index, :create, :edit, :update]
    resources :wines, only: [:show, :index] do
      resources :wine_comments, only: [:create, :destroy]
    end
  end

  get '/customers' => 'public/customers#show', as:'customers'
  get '/customers/information/edit' => 'public/customers#edit', as:'edit_customer'
  get '/customers/confirm' => 'public/customers#confirm', as:'confirm_customer'
  patch '/customers/information' => 'public/customers#update', as:'customer'
  patch '/customers/withdrawl' => 'public/customers#withdrawl', as:'withdrawl_customer'

end