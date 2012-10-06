Gydobjetos::Application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  
  match '/admin/photos/multifile-upload' => "Admin::photos#multifile_upload"
  
  
  root :to=> "site#index"

  match '/new', to: "site#new", as: "email"
  match '/:event', to: "site#index", as: "index"

  
end
