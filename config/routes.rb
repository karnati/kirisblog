Kirisblog::Application.routes.draw do

    devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions"}

  namespace :admin do

    resources :enquiries , :only =>["index","show"] do
        get "search",                                                    :on => :collection
    end
    resources :articles do
      get   "manage_comment_status",                                   :on => :member
      put   "manage_comment_status",                                   :on => :member
      get   "manage_article_status",                                   :on => :member
      put   "manage_article_status",                                   :on => :member
      get "search",                                                    :on => :collection
    end

    resources :users ,:only=>[:index, :show]  do
      get   "manage_status",                                   :on => :member
      put   "manage_status",                                   :on => :member
      get "search",                                                    :on => :collection
    end

    resources :subscribers do
      get   "manage_status",                                   :on => :member
      put   "manage_status",                                   :on => :member
      get "search",                                            :on => :collection
    end

    get "dashboard/index"
  end

  resources :home do
    get "feedback", :on => :collection
    get "about_me", :on => :collection
    get "welcome", :on => :collection
    get "contact_me", :on => :collection
    post "enquiry_mail", :on => :collection
    get "search",        :on => :collection
    get "load_theme", :on => :collection
    post "create_subscriber", :on => :collection
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
