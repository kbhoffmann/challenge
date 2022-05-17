class InventoryItemsController < ApplicationController
  before_action :merchant, except: [:delete_item, :un_delete_item, :update]
  before_action :item, only: [:edit, :delete_item, :un_delete_item, :delete_item_form]

  def index
    @items = @merchant.inventory_items
  end

  def new; end

  def create
    item = merchant.inventory_items.new(item_params)

    if item.save
      redirect_to "/merchants/#{merchant.id}/inventory_items"
    else
      message = item.errors.full_messages.to_sentence
      flash[:notice] = "Item not created: #{message}"

      redirect_to "/merchants/#{merchant.id}/inventory_items/new"
    end
  end

  def edit; end

  def update
    if item.update(item_params)
      redirect_to "/merchants/#{params[:merchant_id]}/inventory_items"
      flash[:alert] = "Successfully Updated Item"
    else
      message = item.errors.full_messages.to_sentence
      flash[:notice] = "Item not updated: #{message}"

      redirect_to "/merchants/#{merchant.id}/inventory_items/#{item.id}/edit"
    end
  end

  def delete_item_form; end

  def delete_item
    comments = params["deletion_comments"]
    item.update(status: 1, deletion_comments: comments )

    redirect_to "/merchants/#{params[:merchant_id]}/inventory_items"
    flash[:alert] = "Successfully Deleted #{item.name}"
  end

  def un_delete_item
    item.update(status: 0, deletion_comments: nil )

    redirect_to "/merchants/#{params[:merchant_id]}/inventory_items"
    flash[:alert] = "Successfully Undeleted #{item.name}"
  end

  private

  def merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def item
    @item = InventoryItem.find(params[:id])
  end

  def item_params
    params.permit(:name, :description, :inventory_count, :price)
  end
end
