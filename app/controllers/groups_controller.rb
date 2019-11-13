class GroupsController < ApplicationController
  before_action :logged_in_user,          only: [:index, :new, :create, :destroy, :group_books, :remove_book_from_group, :book_in_group_new, :book_in_group_create]

  before_action :groups_admin_user,       only: [:new, :create, :destroy, :remove_book_from_group, :book_in_group_new, :book_in_group_create]
  before_action :books_groups_admin_user, only: [:index, :group_books, :book_authors]
  before_action :books_admin_user,        only: [:book_author_new, :book_author_create, :book_author_destroy]                        

  before_action :set_group,               only: [:destroy, :group_books, :remove_book_from_group, :book_in_group_new, :book_in_group_create, 
                                           :book_authors, :book_author_new, :book_author_create, :book_author_destroy ]

  def index
  	@groups = Group.all
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(group_params)
    if @group.save
      flash[:success] = "Save succes"
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def destroy
    books = @group.books   
    AuthorBook.where(book_id: books.map(&:id)).destroy_all
    Book.destroy(books.map(&:id))
    @group.destroy
    flash[:success] = "Group deleted"
    redirect_to groups_path
  end

  def group_books
  	@group_books = @group.books
  end

  def remove_book_from_group
  	book = Book.find(params[:book_id])
    AuthorBook.where(book_id: book.id).destroy_all
  	book.destroy
	  redirect_to books_group_path(@group)
  end

  def book_in_group_new
    @book = Book.new
  end

  def book_in_group_create
    @book = Book.new(book_params)
    if @book.save
      @group.add_book @book
      @group.save
      flash[:success] = "Save succes"
      redirect_to books_group_path(@group)
    else
      render 'book_in_group_new'
    end
  end

  def book_authors
    @book = Book.find(params[:book_id])
  end

  def book_author_new
    @book = Book.find(params[:book_id])
    @author_book = AuthorBook.new
    @author_book.book = @book

  end

  def book_author_create
    @book = Book.find(params[:book_id])
    @author_book = AuthorBook.new(book_author_params)
    @author_book.book = @book
    if @author_book.save
      flash[:success] = "Save succes"
      redirect_to book_authors_path(@group, @book)
    else
      render 'book_author_new'
    end
  end

  def book_author_destroy
    @book = Book.find(params[:book_id])
    author = Author.find(params[:author_id])
    @book.authors.destroy author
    redirect_to book_authors_path(@group, @book)
  end

  private


  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def groups_admin_user
    redirect_to(root_url) unless current_user.is_group_admin?
  end

  def books_admin_user
    redirect_to(root_url) unless current_user.is_books_admin?
  end

  def books_groups_admin_user
    redirect_to(root_url) unless current_user.is_books_admin? || current_user.is_group_admin?
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end

  def book_params
    params.require(:book).permit(:title, :image)
  end

  def book_author_params
    params.require(:author_book).permit(:author_id)
  end
end
