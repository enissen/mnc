Mnc::Application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    
    resources :impresses

    get "impress"       => "impresses#index"
    get "impressum"     => "impresses#index"
    get "avisio_legal"  => "impresses#index"

    resources :contacts

    get "contact"       => "contacts#index"
    get "kontakt"       => "contacts#index"
    get "contacto"      => "contacts#index"

    devise_for :users
  
    get "welcome/intro"
    get "welcome/default"
    
    get "welcome"       => "welcome#default"
    get "willkommen"    => "welcome#default"
    get "bienvenido"    => "welcome#default"

    root 'welcome#intro'

    as :user do
      get "/login"      => "devise/sessions#new"
      delete "/logout"  => "devise/sessions#destroy"
    end

    resources :galleries do
      collection do 
        resources :images
      end
    end

    get "galerias"      => "galleries#index"
    get "galerien"      => "galleries#index"


    get "curriculo"      => "galleries#index"
    get "lebenslauf"     => "galleries#index"
    get "vita"           => "galleries#index"
    


  end

  get "es/impresses", to: redirect("es/avisio_legal")

  #get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  #get '', to: redirect("/#{I18n.default_locale}")

  #match "welcome", to: "welcome#default"
  # resources :statics

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   

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
