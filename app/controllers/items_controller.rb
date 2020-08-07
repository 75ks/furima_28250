class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction, :category_id, :item_condition_id, :postage_payer_id, :area_id, :preparation_day_id).merge(user_id: current_user.id)
  end
end
