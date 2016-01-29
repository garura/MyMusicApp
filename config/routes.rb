Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands
  get '/bands/:band_id/albums/new', :to => 'albums#new', :as => 'new_band_album'
  get '/albums/:album_id/tracks/new', :to => 'tracks#new', :as => 'new_album_track'
  resources :albums, except: [:index, :new]
  resources :tracks, except: [:index, :new]
end
