Rails.application.routes.draw do


devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: "about"


    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'customers/destroy_all' => 'customers#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post 'customers/confirm' => 'customers#confirm'
    get 'customers/complete' => 'customers#complete'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get 'admin' => 'homes#top', as: ""
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
