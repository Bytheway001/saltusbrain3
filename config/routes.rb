Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers:{
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'

  }
  root 'home#index'
  get '/horarios' => 'home#gethorarios'
  get '/pdf' =>'home#pdftest'
  get '/panel'=>'home#panel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/clear'
  get 'personas/clear' => 'personas#clear'
  get 'empresas/clear' => 'empresas#clear'
  get 'schools/clear' => 'schools#clear'
  post '/curriculums' =>'curriculums#set'
  get '/curriculums/select/:id', to: 'curriculums#select', as: 'select'
  get '/curriculums/print/:id/:model', to: 'curriculums#print', as: 'print'
  match 'curriculums/view/:id' => 'curriculums#view', as: 'view', via:[:get,:post]


  resources :curriculums do
  end 

  resources :users, :empresas, :schools,:academies
  resources :personas do
    get :autocomplete_empresa_nombre, :on => :collection
    get :autocomplete_school_nombre, :on => :collection
    get :autocomplete_academy_nombre, :on => :collection
    get 'cv'
  end
  get '*unmatched_route', :to => 'home#noroute!'
end
