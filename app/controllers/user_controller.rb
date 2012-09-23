class UserController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    sign_in @user
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
          redirect_to @user
        else
          render 'edit'
        end
      end
   end

