Rails.application.routes.draw do
  get 'flags/import'
  post 'flags/import', to: "flags#import_csv"
  resources :flags
end
