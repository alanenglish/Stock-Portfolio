class UsersController < ApplicationController
  def portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def friends
    @friendships = current_user.friends
  end

  def search
    @users = User.search(params[:search_param])
    render json: @users
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You must enter search criteria."
    else
      @users = User.search(params[:search_param])
      flash.now[:danger] = "We couldn't find any users that match your search criteria." if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end
end
