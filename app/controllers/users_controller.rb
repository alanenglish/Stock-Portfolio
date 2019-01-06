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
      @users = current_user.except_current_users(@users)
      flash.now[:danger] = "We couldn't find any users that match your search criteria." if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)

    if current_user.save
      flash[:success] = "Friend was successfully added."
    else
      flash[:danger] = "Something went wrong with the friend request."
    end
    redirect_to friends_path
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
end
