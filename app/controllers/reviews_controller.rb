class ReviewsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @review = @item.reviews.build(params[:review].permit(:feedback))
    @review.author = current_user
    @review.save

    redirect_to item_path(@item)
  end
end
