class AuthorsController < ApplicationController
  before_action :books_admin_user, only: [:new]
  
  def index
  	@authors = Author.all
  end

  def author_books 
  	@author = Author.find(params[:id])
  	@author_books = @author.books
  end

  def new
  	@author = Author.new
  end

  def create
  	@author = Author.new(author_params)
    if @author.save
      flash[:success] = "Save succes"
      redirect_to authors_path
    else
      render 'new'
    end
  end


  private

  def books_admin_user
    redirect_to(root_url) unless current_user.is_books_admin?
  end

  def author_params
    params.require(:author).permit(:full_name)
  end
end
