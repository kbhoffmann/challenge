class InventoryItemsController < ApplicationController
  before_action :merchant, except: [:delete_item, :un_delete_item, :update]
  before_action :item, only: [:edit, :delete_item, :un_delete_item, :delete_item_form, :update]

  def index; end

  def new; end

  def create
    item = merchant.inventory_items.new(item_params)
    if item.save
      redirect_to merchant_inventory_items_path
      flash[:notice] = "Successfully Added #{item.name}"
    else
      message = item.errors.full_messages.to_sentence
      flash[:error] = "Item not created: #{message}"

      redirect_to new_merchant_inventory_item_path
    end
  end

  def edit; end

  def update
    if item.update(item_params)
      redirect_to merchant_inventory_items_path
      flash[:notice] = "Successfully Updated Item"
    else
      redirect_to edit_merchant_inventory_item_path
      flash[:alert] = "Item not updated"
    end
  end

  def delete_item_form; end

  def delete_item
    comments = params["deletion_comments"]
    item.update(status: 1, deletion_comments: comments )

    redirect_to merchant_inventory_items_path
    flash[:alert] = "Successfully Deleted #{item.name}"
  end

  def un_delete_item
    item.update(status: 0, deletion_comments: nil )

    redirect_to merchant_inventory_items_path
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
