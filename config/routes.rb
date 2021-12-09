Rails.application.routes.draw do

  #管理者ログイン
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
}
 #トップページ
 root to: "homes#top"

 #予約
 resources :resarvations
 get "/thanx" => "reservations#thanx"


end
