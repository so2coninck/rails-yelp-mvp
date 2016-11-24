class ReviewsController < ApplicationController
  before_action :review_params

 def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    review = Review.new(review_params)
    review.restaurant = @restaurant

    if review.save
      redirect_to restaurants_path
    else
      render "restaurants/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:content,:rating)
  end
end
