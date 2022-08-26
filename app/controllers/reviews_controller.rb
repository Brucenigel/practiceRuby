class ReviewsController < ApplicationController
  before_action :authorize
  # before_action :set_review, only: [:show, :update, :destroy]

  def index 
    @books = Review.all

    render json: @books
  end

  def create
     @book = Book.find(params[:book_id])
     @reviews = @book.reviews.create(review_params.merge(user: @user))


     if @reviews.save
        render json: {message: 'Review was successfully created'}, status: :created
     else
      render json: {message: 'Review was failed to be created'}, status: :unprocessable_entity
     end
  end


    # Only allow a trusted parameter "white list" through.
    def review_params
      params.permit(:comment, :rating )
    end
end
