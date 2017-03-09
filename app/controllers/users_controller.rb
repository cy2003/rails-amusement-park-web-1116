require 'pry'

class UsersController < ApplicationController
before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def authenticate_user
    if !session[:user_id]
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :happiness,
      :nausea,
      :tickets,
      :password,
      :admin
    )
  end

end
