Rails.application.routes.draw do
  root 'home#index'

  resources :landing_photos
  resources :faqs, except: %(show)
  resources :categories, except: [:new]
  resources :comments, except: %w(index show new destroy)
  resources :rules, except: %w(show destroy)
  resources :tags, only: [:index, :edit, :create, :update, :destroy]
  resources :enrollments, only: [:create]
  resources :notifications, only: [:index]

  namespace :users do
    delete :unenroll
    post :import
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, except: %w(new create edit update) do
    resources :notifications, only: [:index]
  end

  post 'majors/email', to: 'majors#send_email', as: :mailer
  resources :majors do
    resources :articles
    resources :comments, except: %w(index show new)
    resources :major_faqs, except: %w(index show)
  end

  resources :articles do
    resources :comments, except: %w(index show new)
  end

  get '/account', to: 'home#account'
  get '/about_us', to: 'home#about_us'
  get '/credits', to: 'home#credits'

  get '/admins', to: 'admins#index'
  post '/create_admin', to: 'admins#create_admin'
  delete '/delete_admin', to: 'admins#delete_admin'
  post '/create_major_admin', to: 'admins#create_major_admin'
  delete '/delete_major_admin', to: 'admins#delete_major_admin'
  post '/create_distinguished_section_admin', to: 'admins#create_admin_distinguished_section'
  delete '/delete_distinguished_section_admin', to: 'admins#delete_admin_distinguished_section'

  delete '/delete_attachment/:id', to: 'application#remove_attachment', as: :delete_attachment

  post 'distinguished_sections/request', to: 'distinguished_sections#request_section'
  resources :distinguished_sections, except: %w(show new)

  post 'more_topics', to: 'topics#more_topics', as: :more_topics
  resources :topics do
    resources :comments, except: %w(index show new)

    collection do
      get 'mine', to: 'topics#mine', as: :my
      get 'archived', to: 'topics#index_archived'
    end

    member do
      put 'toggle_status', to: 'topics#toggle_status'
    end
  end

  post 'more_virtual_rooms', to: 'virtual_rooms#more_virtual_rooms', as: :more_virtual_rooms
  resources :virtual_rooms do
    resources :comments, except: %w(index show new)

    collection do
      get 'mine', to: 'virtual_rooms#mine', as: :my
      get 'archived', to: 'virtual_rooms#index_archived'
    end

    member do
      put 'toggle_status', to: 'virtual_rooms#toggle_status'
    end
  end
end
