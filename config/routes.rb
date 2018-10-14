#---
# Excerpted from "Agile Web Development with Rails 5",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails5 for more book information.
#---
Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    # HTTP 方法约束
    # via: :all 相当于这个action 匹配所有 http 请求，get、post、put、patch 和 delete
    root 'store#index', as: 'store_index', via: :all # 可替代 via: [:get, :post]
  end

  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end

