Rails.application.routes.draw do

  devise_for :users
mount Ckeditor::Engine => '/ckeditor'

get 'sitemap' => 'sitemap#index'

get 'blogs' => 'blogs#index', as: :blogs
get 'blogs/new' => 'blogs#new', as: :new_blog
post 'blogs' => 'blogs#create'

get ':blog_id' => 'blogs#show', as: :blog
get ':blog_id/edit' => 'blogs#edit', as: :edit_blog
patch ':blog_id' => 'blogs#update'
put ':blog_id' => 'blogs#update'
delete ':blog_id' => 'blogs#destroy'

# Routes about TAGS
get ':blog_id/tags/tagtool' => 'tags#tagtool'
post ':blog_id/tags' => 'tags#index', as: :tags
post ':blog_id/tags' => 'tags#create'
get ':blog_id/tags/:word' => 'tags#show', as: :blog_tag
post ':blog_id/tags/:word' => 'tags#update'
delete ':blog_id/tags/:word' => 'tags#destroy'

get ':blog_id/posts' => 'posts#index', as: :posts
get ':blog_id/posts/new' => 'posts#new', as: :new_post
post ':blog_id/posts' => 'posts#create'

get ':blog_id/:post_id' => 'posts#show', as: :blog_post
get ':blog_id/:post_id/edit' => 'posts#edit', as: :edit_post
patch ':blog_id/:post_id' => 'posts#update'
put ':blog_id/:post_id' => 'posts#update'
delete ':blog_id/:post_id' => 'posts#destroy'



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
