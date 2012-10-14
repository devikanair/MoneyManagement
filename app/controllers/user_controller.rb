class UserController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.paginate(:per_page => 1, :page => params[:page])
  end
  def show
    @user = User.find(params[:id])
    @expenses = @user.expenses
    @expenses_form = @user.expenses.build
    @spent=0
    @expenses.each {|loop|
        if(!loop.nil? && !loop.amount.nil?)
          @spent = @spent +   loop.amount
        end
      }
  end
  def edit
    @user = User.find(params[:id])
  end
  def cash
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    end
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
  def cash
    @user = current_user
    @cash =  params[:cash]
    @cash = current_user.cash + @cash.to_f
    @user.update_column(:cash,@cash)
    redirect_to @user
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

