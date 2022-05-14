class InventoryItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.find(params[:id])
    item = merchant.inventory_items.new(item_params)

    if item.save
      redirect_to "/merchants/#{merchant.id}/inventory_items"
    else
      message = item.errors.full_messages.to_sentence
      flash[:notice] = "Item not created: #{message}"

      redirect_to "/merchants/#{merchant.id}/inventory_items/new"
    end
  end

  private

  def item_params
    params.permit(:name, :description, :inventory_count, :price)
  end
end
