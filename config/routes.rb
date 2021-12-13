Rails.application.routes.draw do

  #管理者ログイン
  devise_for :admins
  
  #トップページ
  root "homes#top"

  #予約
  resources :resarvations
  get "thanx" => "reservations#thanx"

 end
