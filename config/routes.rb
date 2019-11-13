Rails.application.routes.draw do
  
  root 'home#index'
  
  get    '/signup',                                    to: 'users#new'
  get    '/login',                                     to: 'sessions#new'
  post   '/login',                                     to: 'sessions#create'
  delete '/logout',                                    to: 'sessions#destroy'

  resources :users do
    get  'books-admin',  on: :member, to: 'users#books_admin'
    get  'groups-admin', on: :member, to: 'users#groups_admin'
  end

  resources :authors, only: [:index, :new, :create] do
    get  'books', on: :member,                         to: 'authors#author_books'
  end

  resources :groups do
    get  'books', on: :member,                         to: 'groups#group_books'
  end
  delete '/group/:id/book/:book_id/remove',            to: 'groups#remove_book_from_group', as: :remove_book_from_group
  get    '/group/:id/book/new',                        to: 'groups#book_in_group_new',      as: :book_in_group_new
  post   '/group/:id/book',                            to: 'groups#book_in_group_create',   as: :book_in_group_create
  
  get    '/group/:id/book/:book_id/authors',           to: 'groups#book_authors',           as: :book_authors
  get    '/group/:id/book/:book_id/author/new',        to: 'groups#book_author_new',        as: :book_authors_new
  delete '/group/:id/book/:book_id/author/:author_id', to: 'groups#book_author_destroy',    as: :book_authors_destroy
  post   '/group/:id/book/:book_id/author',            to: 'groups#book_author_create',     as: :book_authors_create



  #resources :books
  
end
