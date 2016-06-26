class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: '本を登録しました。'
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
    params.require(:book).permit(:title)
  end
end
