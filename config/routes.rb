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
      get "/signup"      => "devise/registrations#new"
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

end
