Tatzoo::Application.routes.draw do

  # Root and User routes
  root                :to => "pages#home"

  devise_for          :users, :controllers => { :invitations => 'users/invitations'}
  devise_for          :users do
    match "/invite",  :to => "users/invitations#new"
  end
  
  resources           :users do
    member do
      get             :following, :followers
    end
  end
  resources           :posts, :only => [:show, :create, :destroy] do
    resources         :comments, :only => [:create, :destroy]
  end
  resources           :relationships, :only => [:create, :destroy]
  
  # Page routes
  match "/feed",      :to => "pages#index"
  match "/help",      :to => "pages#help"
  match "/about",     :to => "pages#about"
  match "/contact",   :to => "pages#contact"
end
