Rails.application.routes.draw do

  #管理者ログイン
  devise_for :admins

  #トップページ
  root "homes#top"

  #予約
  resource :reservations, only: [] do
    get "/new_date" => "reservations#new_date"
    get "/new_main" => "reservations#new_main"
    get "/confirm" => "reservations#confirm"
    get "/thanx" => "reservations#thanx"
  end
  resources :reservations, only: [:index, :create, :edit, :show, :update, :destroy]


 end
