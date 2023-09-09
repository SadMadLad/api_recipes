# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find params[:id]
    render @user
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    render json: { message: 'User has been destroyed' }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :dob, :nationality)
  end
end
