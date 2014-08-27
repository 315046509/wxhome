Weixin::Application.routes.draw do
  resources :mains
  resources :cccabouts do
    collection do
      get 'disclaimer'
      get 'privacy'
      get 'job'
      get 'contact'
      get 'links'
    end
  end

  mount Ckeditor::Engine => '/ckeditor'
  root :to => "main#index"
  resources :mains
  resources :services do
    collection do
      get 'website'
      get 'marketing'
    end
  end
  resources :abouts
  resources :cases
  resources :contact
  resources :questions
  resources :weixin do
    collection do
      get 'contrast'
    end
  end
  resources :news
  #admin
  namespace :admin do
    match '' => 'cases#index', :via => :get
    match '/login' => 'main#login', :via => :get
    match '/logout' => 'main#logout', :via => :get
    resources :main do
      collection do
        post 'check_login'
      end
    end
    # 案例
    resources :cases
    # 问题
    resources :questions
    # 新闻
    resources :journalisms
    # 长春车生活招聘
    resources :jobs
    # 长春车生活招商
    resources :cccshs
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
