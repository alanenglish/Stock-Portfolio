class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        render 'users/portfolio'
      else
        flash[:danger] = "You have entered an invalid stock ticker."
        redirect_to portfolio_path
      end
    else
      flash[:danger] = "Please submit a valid stock ticker."
      redirect_to portfolio_path
    end
  end
end
