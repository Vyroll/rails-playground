Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  # == Helpers ==
  # <name>_url   showcase_articles_url   http://localhost:3000/articles/showcase
  # <name>_path  showcase_articles_path  /articles/showcase

  # == Helper Usage ==

  # <%= link_to 'Ad details', magazine_ad_path(@magazine, @ad) %>

  # # using url_for - route will be found automatically based on passed parameters
  # <%= link_to 'Ad details', url_for([@magazine, @ad]) %>

  # # implied url_for
  # <%= link_to 'Ad details', [@magazine, @ad] %>

  # # singular parameter
  # <%= link_to 'Ad details', @magazine %>

  # # specifying action
  # <%= link_to 'Edit Ad', [:edit, @magazine, @ad] %>

  # == Resourceful ==
  # :controller, :constraints, :as, :path_names, :only, :except, :param

  # resources :users
  # resource :user

  # == scoping ==
  # :path

  # scope 'shop' do
  #   resources :products
  # end

  # -- namespace --
  # scope :path, :module, :as

  # namespace :shop do
  #   resources :products
  # end

  # == nesting ==
  # :path, :as

  # resources :articles do
  #   resources :comments
  # end

  # # same ass
  # resources :articles
  # resources :comments, path: 'articles/:article_id/comments', as: 'article_comments'

  # -- shallow nesting --

  # resources :articles do
  #   resources :comments, shallow: true
  # end

  # # scope :shallow
  # resources :articles, shallow: true do
  #   resources :comments
  #   resources :quotes
  #   resources :drafts
  # end

  # # scope :shallow
  # shallow do
  #   resources :articles do
  #     resources :comments
  #     resources :quotes
  #     resources :drafts
  #   end
  # end

  # # scope :shallow_path, :shallow_prefix
  # resources :articles, shallow_path: 'sekret', shallow_prefix: 'sekret' do
  #   resources :comments, shallow: true
  # end

  # == Concerns ==
  # concern :commentable do
  #   resources :comments
  # end

  # resources :messages, concerns: :commentable

  # == non-CRUD ==

  # # block
  # resources :photos do
  #   member do
  #     get 'preview'
  #   end
  #   collection do
  #     get 'search'
  #   end
  # end

  # single line
  # resources :photos do
  #   get 'preview' # /photos/:photo_id/preview
  #   get 'preview', on: :member # /photos/:id/preview
  #   get 'search', on: :collection # /photos/search
  #   get 'preview', on: :new # /photos/new/preview
  # end

  # == Non-Resourceful ==
  # <method> '<path>/<:param>', to: '<controller>#<action>'

  # get 'photos', to: 'photos#show'

  # -- params --

  # get 'photos(/:id)', to: 'photos#show' # optional
  # get 'photos/:id', to: 'photos#show' # required
  # get 'photos/:id/:user_id', to: 'photos#show' # multiple

  # -- defaults --

  # get 'photos/:id(/:type)', to: 'photos#show', defaults: { type: 'jpg' }
  # get 'photos/:id', to: 'photos#show', defaults: { type: 'jpg' }
  # # block
  # defaults type: :jpg do
  #   get 'photos/:id', to: 'photos#show'
  # end

  # -- Naming --

  # get 'exit', to: 'sessions#destroy', as: :logout

  # override default
  # get ':username', to: 'users#show', as: :user
  # resources :users

  # -- Match multiple methods --

  # match 'photos', to: 'photos#show', via: [:get, :post]
  # match 'photos', to: 'photos#show', via: :all

  # -- Constraining --

  # # parameters
  # get 'articles/:id', to: 'articles#show', constraints: { id: /[2-9]/ }
  # get 'articles/:id', to: 'articles#show', id: /[2-9]/

  # # prequest
  # get 'photos', to: 'photos#index', constraints: { subdomain: 'admin' }

  # # block
  # # scope :subdomain...
  # namespace :admin do
  #   constraints subdomain: 'admin' do
  #     resources :photos
  #   end
  # end

  # == wildcard ==

  # get 'books/*section/:title', to: 'books#show'
  # url = books/some/section/last-words-a-memoir
  # params[:section] = 'some/section'
  # params[:title] = 'last-words-a-memoir'

  # == Redirec ==

  # get '/stories/:name', to: redirect('/articles/%{name}')

  # == root ==

  # root to: 'pages#main'
  # root 'pages#main' # shortcut for the above

  # namespace :admin do
  #   root "admin#index"
  # end

  # == Direct ==

  # direct :homepage do
  #   "http://www.rubyonrails.org"
  # end

  # == resolve==

  # resource :comment
  # resolve('Comment') { [:comment] }
end
