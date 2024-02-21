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
  end
  namespace :admin do
    get 'companies/index'
    get 'companies/show'
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
    get 'wines/index'
    get 'wines/show'
    get 'wines/new'
    get 'wines/edit'
  end
  namespace :admin do
    get '/' => 'homes#top'
  end
  namespace :public do
    get 'deliveries/index'
    get 'deliveries/edit'
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
  namespace :public do
    get 'wines/index'
    get 'wines/show'
  end
  namespace :public do
    get 'companies/index'
    get 'companies/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end

  scope module: :public do
    get 'homes/top'
    get 'homes/about'

    resources :countries, only: [:show, :index]
    resources :companies, only: [:show, :index]
    resource :favorite_companies, only: [:create, :destroy]
  end


end