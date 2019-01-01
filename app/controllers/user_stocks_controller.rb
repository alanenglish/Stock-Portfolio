class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "#{@user_stock.stock.company} was successfully added to your Portfolio"
    redirect_to portfolio_path
  end

end
