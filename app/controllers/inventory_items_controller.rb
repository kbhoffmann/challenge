class InventoryItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
  end

  def new; end
    
end
