class BooksController < ApplicationController
  def index
    @page = params[:page].to_i
    @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    if @book.save 
      flash[:notice] = "Book was successfully added."
      redirect_to books_path
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully updated."
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully deleted."
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :price, :published_date, :publisher, :pages, :release_date)
  end

end
