Peekbox::Application.routes.draw do
  resources :s3_uploads

	devise_for :users, :controllers => {:session => "user/session"} 

	post "zencoder-callback" => "zencoder_callback#create", :as => "zencoder_callback"

	get "profile" => "profile/profile#index"

	namespace :admin do
		resources :categories, :only => [:index, :new, :create, :edit, :update] 
		resources :albums
		resources :contests do
			member do
				get "change_status"
			end
		end
		resources :eligibilities
		resources :feature, :only => [:index] do
			collection do
				get "events"
				get "special"
				get "videos"
				get "albums"
			end
		end
		resources :video_ads
		resources :ads
		resources :event_banner
		resources :banner
		resources :user do
			collection do
				get "ban"
				get "unban"
				get "ban_list"
				get "delete_user"
				get "make_admin"
				get "make_normal"
				get "admin"
			end
		end
	end

	#Users
	namespace :profile do
		resources :video_bookmark do
			collection do
				post "unbookmark"
			end
		end
		resources :picture_bookmark do
			collection do
				post "unbookmark"
			end
		end
		resources :bookmark, :only => [:index, :create, :destroy] do
			collection do
				post "unbookmark"
			end
		end
		resources :information
		resources :crop
		resources :user, :only => [:save, :update] do 
			resources :wall_post, :only => [:create, :destroy]
			collection do
				post "save"
			end
		end
		resources :users, :only => [:index] do 
			collection do
				post "search"
			end
		end
		resources :albums do
			resources :pictures do 
				collection do
					post 'multiupload'
				end
			end
		end
		resources :friends do
			collection do
				get 'search'
				get 'all'
				get 'add', :path => 'add/:id'
			end
		end
		resources :messages do
			collection do
				get "inbox"
				post "send_message"
				get "sent"
				get "compose"
			end
		end
		resources :events
		resources :videos do
			collection do
				get "uploaded"
			end
			resources :comments
		end
	end

	#Videos
	resources :videos, :only => [:show, :index]

	# Events
	resources :events, :only => [:show, :index]

	#Albums
	resources :albums, :only => [:show, :index] do
		resources :pictures, :only => [:show, :index]
	end

	resources :category, :only => [:show], :path => "/video/category/"



	get "help" => "static#help"

	get "company" => "static#company"
	post "contact" => "static#contact"


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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match ":username" => "information#show", :as => "other_user"
  match ":username/friends" => "information#friends", :as => "other_user_friends"

end
