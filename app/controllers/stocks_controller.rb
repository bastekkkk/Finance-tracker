class StocksController < ApplicationController

def search
if params[:stock].present?
  @stock = Stock.new_form_lookup(params[:stock])
  if @stock
    render 'users/my_portfolio'
  else
    flash[:danger] = "you have entered  an incorrect symbol"
    redirect_to my_portfolio_path
  end
else
  flash[:danger] = "you have entered empety string"
  redirect_to my_portfolio_path
end
end
end
