class BooksController < ApplicationController
  # GET / or GET /books
  def index
    @books = Book.order('rate DESC, id ASC')
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to :books_url
    else
      render :new
    end
  end

  # GET/books/new
  def new
    @book = Book.new
  end

  # GET /books/:id/edit
  def edit
    @book = Book.find(params[:id])
  end

  # GET /books/:id
  def show
    @book = Book.find(params[:id])
  end

  # PATCH /books/:id
  def update
    @book = Book.find(params[:id])

    if @book.save
      redirect_to @book, notice: '本を更新しました。'
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :rate)
  end
end
