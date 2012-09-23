class UserController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @expenses = @user.expenses
    @spent=0
    @expenses.each {|loop| @spent = @spent +   loop.amount }
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
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

