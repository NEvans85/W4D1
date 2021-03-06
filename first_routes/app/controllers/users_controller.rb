class UsersController < ApplicationController
  def index
    if params.empty?
      @users = User.all
    else
      @users = User.find_by(username: params['username'])
    end
    if @users
      render json: @users
    else
      render json: @users.errors.full_message, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
