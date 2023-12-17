class Api::BooksController < ApplicationController
    def index 
        @books = Book.all()
        render json: @books
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def create
        @book = Book.new(book_params)
    
        if @book.save
          render json: @book, status: :created
        else
          render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @book = Book.find(params[:id])
        if @book.destroy
            render json: { message: 'Book successfully deleted' }, status: :ok
        else
            render json: { errors: 'Unable to delete book' }, status: :unprocessable_entity
        end
    end

    private

    def book_params
        params.require(:book).permit(:name, :author_id)
    end

end
