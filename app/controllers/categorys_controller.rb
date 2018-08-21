class CategorysController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @category = @item.categorys.create(params[:category].permit(:name))

    redirect_to item_path(@item)
  end
end
