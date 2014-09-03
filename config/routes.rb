Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


get 'blogs' => 'blogs#index', as: :blogs
get 'blogs/new' => 'blogs#new', as: :new_blog
post 'blogs' => 'blogs#create'

get ':blog_id' => 'blogs#show', as: :blog
get ':blog_id/edit' => 'blogs#edit', as: :edit_blog
patch ':blog_id' => 'blogs#update'
put ':blog_id' => 'blogs#update'
delete ':blog_id' => 'blogs#destroy'

get ':blog_id/posts' => 'posts#index', as: :posts
get ':blog_id/posts/new' => 'posts#new', as: :new_post
post ':blog_id/posts' => 'posts#create'

#get ':blog_id/:post_id' => 'posts#show', as: :post, as: :blog_post
get ':blog_id/:post_id' => 'posts#show', as: :blog_post
get ':blog_id/:post_id/edit' => 'posts#edit', as: :edit_post
patch ':blog_id/:post_id' => 'posts#update'
put ':blog_id/:post_id' => 'posts#update'
delete ':blog_id/:post_id' => 'posts#destroy'

resources :tags

#get ':blogtextid/category/:word' => 'tags#show'
#get ':blogtextid/new' => 'posts#new'
#get ':blogtextid/:posttextid/edit' => 'posts#edit'
#post ':blogtextid' => 'posts#create'
#post ':blogtextid/:posttextid' => 'posts#update'
#get ':blogtextid/:posttextid' => 'posts#show'


#get ':blog_id' => 'blogs#posts#index'
#resources :blogs do
#  resources :posts, shallow: true
#end

#resources :posts



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
