Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get "/admin" => "admin/dashboard#index"

  namespace :admin do
    get "dashboard" => "dashboard#index"
    get "changelog" => "dashboard#changelog"
    
    resources :users, except: :show

    resources :welcome

    resources :promotions, except: [:new, :create]

    resources :pages, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :posts, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :post_categories, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :galleries do
      get :bulk_destroy, on: :collection
    end

    resources :vehicles, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :vehicle_filters, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :products, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :product_categories, except: :show do
      get :bulk_destroy, on: :collection
    end

    resources :links, except: :show do
      get :bulk_destroy, on: :collection
    end

    get "search" => "search#index"

    get "media/documents" => "media#documents"
    get "media/pictures" => "media#pictures"

    get "media/bulk_destroy_documents" => "media#bulk_destroy_documents"
    get "media/bulk_destroy_pictures" => "media#bulk_destroy_pictures"
  end

  resources :posts, only: :index

  match "coasters" => "promotions#show", via: :get, id: 'coasters'
  match "commuters" => "promotions#show", via: :get, id: 'commuters'
  match "motorhomes" => "promotions#show", via: :get, id: 'motorhomes'
  match "iveco-tonto" => "promotions#show", via: :get, id: 'iveco-tonto'
  match "iveco-trakker" => "promotions#show", via: :get, id: 'iveco-trakker'

  get "enquiries/enquiry_types" => "enquiries#enquiry_types", as: :enquiry_types, defaults: { format: 'js' }, constraints: { format: ['json', 'js'] }
  post "enquiries/send_enquiry" => "enquiries#send_enquiry", as: :send_enquiry, defaults: { format: 'json' }, constraints: { format: 'json' }

  get "posts/:slug" => "posts#show", as: :post
  get "vehicles/:slug" => "vehicles#show", as: :vehicle

  get "search" => "search#index"
  get "vehicle_search" => "vehicles#search"

  get "shop/:category_slug" => "store#index", as: :store
  get "shop/:category_slug/:product_slug" => "store#show", as: :product

  namespace :redactor_rails do
    resources :pictures,  :only => [:index, :create, :destroy]
    resources :documents, :only => [:index, :create, :destroy]
  end

  get "sitemap.xml" => "welcome#sitemap", as: :sitemap, defaults: { format: 'xml' }, constraints: { format: 'xml' }
  get "robots.txt" => "welcome#robots", as: :robots, defaults: { format: 'text' }, constraints: { format: 'text' }

  get "/:slug" => "pages#show", as: :page
end
