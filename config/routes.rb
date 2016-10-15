Rails.application.routes.draw do
  put 'flags/assign_class', to: "flag_classes#assign_class"
  get 'flags/import'
  post 'flags/import', to: "flags#import_csv"
  resources :flag_classes
  resources :flags
end
