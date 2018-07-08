# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                      root GET    /                                                                                        groups#index
#                join_group POST   /groups/:id/join(.:format)                                                               groups#join
#                quit_group POST   /groups/:id/quit(.:format)                                                               groups#quit
#               group_posts GET    /groups/:group_id/posts(.:format)                                                        posts#index
#                           POST   /groups/:group_id/posts(.:format)                                                        posts#create
#            new_group_post GET    /groups/:group_id/posts/new(.:format)                                                    posts#new
#           edit_group_post GET    /groups/:group_id/posts/:id/edit(.:format)                                               posts#edit
#                group_post GET    /groups/:group_id/posts/:id(.:format)                                                    posts#show
#                           PATCH  /groups/:group_id/posts/:id(.:format)                                                    posts#update
#                           PUT    /groups/:group_id/posts/:id(.:format)                                                    posts#update
#                           DELETE /groups/:group_id/posts/:id(.:format)                                                    posts#destroy
#                    groups GET    /groups(.:format)                                                                        groups#index
#                           POST   /groups(.:format)                                                                        groups#create
#                 new_group GET    /groups/new(.:format)                                                                    groups#new
#                edit_group GET    /groups/:id/edit(.:format)                                                               groups#edit
#                     group GET    /groups/:id(.:format)                                                                    groups#show
#                           PATCH  /groups/:id(.:format)                                                                    groups#update
#                           PUT    /groups/:id(.:format)                                                                    groups#update
#                           DELETE /groups/:id(.:format)                                                                    groups#destroy
#            account_groups GET    /account/groups(.:format)                                                                account/groups#index
#                           POST   /account/groups(.:format)                                                                account/groups#create
#         new_account_group GET    /account/groups/new(.:format)                                                            account/groups#new
#        edit_account_group GET    /account/groups/:id/edit(.:format)                                                       account/groups#edit
#             account_group GET    /account/groups/:id(.:format)                                                            account/groups#show
#                           PATCH  /account/groups/:id(.:format)                                                            account/groups#update
#                           PUT    /account/groups/:id(.:format)                                                            account/groups#update
#                           DELETE /account/groups/:id(.:format)                                                            account/groups#destroy
#             account_posts GET    /account/posts(.:format)                                                                 account/posts#index
#                           POST   /account/posts(.:format)                                                                 account/posts#create
#          new_account_post GET    /account/posts/new(.:format)                                                             account/posts#new
#         edit_account_post GET    /account/posts/:id/edit(.:format)                                                        account/posts#edit
#              account_post GET    /account/posts/:id(.:format)                                                             account/posts#show
#                           PATCH  /account/posts/:id(.:format)                                                             account/posts#update
#                           PUT    /account/posts/:id(.:format)                                                             account/posts#update
#                           DELETE /account/posts/:id(.:format)                                                             account/posts#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# 

Rails.application.routes.draw do
  devise_for :users

  root 'groups#index'
  
  resources :groups do
  	member do
  	  post :join
  	  post :quit
  	end
  	resources :posts
  end
  
  namespace :account do
    resources :groups
    resources :posts
  end

end
