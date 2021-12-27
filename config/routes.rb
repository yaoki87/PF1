Rails.application.routes.draw do

  get '/admin/sign_up', controller: 'application', action: 'render_404'
  #管理者ログイン
  devise_for :admins
  #トップページ
  root "homes#top"

  #管理者トップ
  get "/top" => "homes#admin_top"

  #menuページ
  get "/menu" => "homes#menu"

  #予約
  resource :reservations, only: [] do
    get "/new_date" => "reservations#new_date"
    get "/new_main" => "reservations#new_main"
    get "/confirm" => "reservations#confirm"
    get "/thanx" => "reservations#thanx"
    get "/calendar" => "reservations#calendar"
  end
  resources :reservations, only: [:index, :create, :edit, :show, :update, :destroy]


 end
