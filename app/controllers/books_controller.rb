class BooksController < ApplicationController
  # before_action :set_book, only: %i[ show update destroy ]
rescue_from ActiveRecord::RecordNotFound, with: :book_not_found 



  # GET /books
  def index
    @books = Book.all
    render json: @books,  except: [:created_at, :updated_at], status: :ok
  end

  # GET /books/1
  def show
    #when using the find_by database method 
    # @book = find_book
    # if @book
    #   render json: @book, except: [:created_at, :updated_at], status: :ok
    # else 
    #   book_not_found
    # end

    # When using find mehtod
  #   @book = find_book
  #   render json: @book, except: [:created_at, :updated_at], status: :ok
  # rescue ActiveRecord::RecordNotFound
  #   book_not_found

  # When using find mehtod
  @book = find_book
  render json: @book, except: [:created_at, :updated_at], status: :ok
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: {errors: "book not created"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
     @book = find_book
     @book.update(book_params)
      render json: @book, status: :accepted
  end

  # DELETE /books/1
  def destroy
    @book = find_book
      @book.destroy
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_book
      Book.find(params[:id])
    end

    def book_not_found
      render json: {errors: "book not found!"}, status: :not_found
    end
    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:ttitle, :author, :publisher, :year_of_publish, :genre, :synopsis)
    end
end
