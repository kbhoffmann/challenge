class InventoryItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @items = @merchant.inventory_items
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

  def edit
    @merchant = Merchant.find(params[:id])
    @item = InventoryItem.find(params[:item_id])
  end

  def update
    item = InventoryItem.find(params[:item_id])

    item.update(item_params)
    redirect_to "/merchants/#{params[:id]}/inventory_items"
    flash[:alert] = "Successfully Updated Item"
  end

  private

  def item_params
    params.permit(:name, :description, :inventory_count, :price)
  end
end