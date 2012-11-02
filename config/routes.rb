Gydobjetos::Application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  
  match '/admin/photos/multifile-upload' => "Admin::photos#multifile_upload"
  match '/admin/home_photos/multifile-home-photos-upload' => "Admin::home_photos#multifile_home_photos_upload", as: "multifile_home_photos"
  match '/admin/categories/new_category/:page_id' => "Admin::categories#new_category", as: "new_category"
  match '/admin/products/new_product/:category_id' => "Admin::products#new_product", as: "new_product"
  

  root :to=> "site#index"

  match '/load_product', to: "site#load_product", as: "load_product"
  match '/new', to: "site#new", as: "email"
  match '/:event', to: "site#index", as: "index"

  
end
