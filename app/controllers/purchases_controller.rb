class PurchasesController < ApplicationController
  def index
    @purchases = current_user.purchases.order('created_at DESC')
  end

  def new
    @purchase = current_user.purchases.new
    @object = Note.find(params[:object_id]) if params[:category] == 'note'
    @object = Magazine.find(params[:object_id]) if params[:category] == 'magazine'
  end

  def create
    @purchase = current_user.purchases.create(purchase_params)
    current_user.cash -= @purchase.price
    current_user.save
    
    redirect_to note_path(@purchase.object_id) if @purchase.category == 'note'
    redirect_to magazine_path(@purchase.object_id) if @purchase.category == 'magazine'
  end

  private

  def purchase_params
    params.require(:purchase).permit(:object_id, :category, :price)
  end
end
