class UsersController < ApplicationController
  def portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
end
