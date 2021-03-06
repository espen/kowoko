Kowoko::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  resources :cities do |city|
    resources :events
  end
  resources :events do |event|
    match "attend" => "attendees#create"
  end
  
  root :to => "welcome#index"
  
end
