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
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    get 'customers/my_page' => 'customers#show'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
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
