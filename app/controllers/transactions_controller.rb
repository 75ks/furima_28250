class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  def index

  end

  def create

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
end
