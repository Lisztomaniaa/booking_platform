class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  has_scope :by_category, type: :array
  has_scope :by_name
  has_scope :by_city, type: :array
  has_scope :available, using: %i[rent_start, rent_end], type: :hash
   has_scope :booked, using: %i[rent_start, rent_end], type: :hash


  # GET /items
  # GET /items.json
  def index
     @items = apply_scopes(Item).all
    # if params[:city_id]
    #   @items = Item.by_city(params[:city_id])
    # else
    #   @items = Item.all
    # end
  end

def owned
  @items = current_user.items
end
  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @review = @item.reviews.build
    @booking = @item.bookings
  end

  # GET /items/new
  def new
  @item = Item.new

  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.owner = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :category_id, :price, :description)
    end
end
