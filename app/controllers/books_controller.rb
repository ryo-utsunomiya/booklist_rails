class BooksController < ApplicationController
  # GET / or GET /books
  def index
    @books = Book.order('rate DESC, id ASC')
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to :action => :index
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

  # DELETE /books/:id
  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_url
  end

  # POST /books/:id/plus_rate
  def plus_rate
    @book = Book.find(params[:id])
    @book.rate += 1
    @book.save

    redirect_to :action => :index
  end

  private

  def book_params
    params.require(:book).permit(:title, :rate)
  end
end
