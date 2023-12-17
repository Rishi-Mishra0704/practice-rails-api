class Api::AuthorsController < ApplicationController
    def index
        @authors = Author.all()
        render json: @authors
    end

    def show
        @author = Author.find(params[:id])
        render json: @author
    end
    def create
        @author = Author.new(author_params)
    
        if @author.save
          render json: @author, status: :created
        else
          render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @author = Author.find(params[:id])
        if @author.destroy
          render json: { message: 'Author successfully deleted' }, status: :ok
        else
          render json: { errors: 'Unable to delete author' }, status: :unprocessable_entity
        end
      end

    private

    def author_params
        params.require(:author).permit(:name, :age, :rating)
    end
end
