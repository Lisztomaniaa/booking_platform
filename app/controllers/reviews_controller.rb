class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.author = current_user
    @review.save

    redirect_to (@review.reviewable_type == 'Item' ? item_path(@review.reviewable) : root_path) #user_path(@review.reviewable)
  end

  def review_params
    params[:review].permit(:feedback, :reviewable_id, :reviewable_type)
  end
end
