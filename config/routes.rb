Rails.application.routes.draw do
  resources :deaths
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :path=>'',
             :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  resources :users, only: [:show]
  resources :scolarites
  resources :mbtis
  resources :formations
  resources :recommandations

 resources :profil_psychos

  resources :deaths do
    match '/scrape', to: 'deaths#scrape', via: :post, on: :collection
  end

end

