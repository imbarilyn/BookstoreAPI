class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  # GET /books/1
  def show
    set_book
    if @book
      render json: @book, status: :ok
    else 
      render json: {errors: "Book not found!"}, status: :not_found
    end
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: {errors: "book not creatted"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
     set_book
     if @book 
      @book.update(book_params)
      render json: @book, status: :accepted
     else 
      render json: {errors: "book not found!"}, status: :not_found
     end
  end

  # DELETE /books/1
  def destroy
    set_book
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:ttitle, :author, :publisher, :year_of_publish, :genre, :synopsis)
    end
end
