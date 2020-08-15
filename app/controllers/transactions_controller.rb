class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  def index

  end

  def create
    @item = Item.find(params[:id])
    @order = OrderAddress.new(order_params)
    
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def correct_user
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif user_signed_in? && Order.find_by(item_id: @item.id).present?
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:token, :post_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
