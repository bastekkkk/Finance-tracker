class StocksController < ApplicationController

def search

  if params[:stock].blank?
    flash.now[:danger] = "You have entered an empety string"
  else
    @stock = Stock.new_form_lookup(params[:stock])
    flash.now[:danger] = "You have entered incorrect stock symbol" unless @stock
  end
    respond_to do |format|
      format.js {render partial: 'users/results'}
  end
end

def destory
  stock = Stock.find(params[:id])
  @user_stock = UserStock.where(user_id: current_user, stock_id: stock.id).first
  @user_stock.destroy
  flash[:success] = "Stack successfully removed from portfolio"
  redirect_to my_portfolio_path

end





#def search
#if params[:stock].present?
#  @stock = Stock.new_form_lookup(params[:stock])
#  if @stock
#    respond_to do |format|
#    format.js {render partial: 'users/results'}
#  end
#  else
#    respond_to do |format|
#    flash.now[:danger] = "you have entered  an incorrect symbol"
#    format.js {render partial: 'users/results'}
#  end
#  end
#else
#  respond_to do |format|
#  flash.now[:danger] = "you have entered empety search string"
#  format.js {render partial: 'users/results'}
#end
#end
#end


end
