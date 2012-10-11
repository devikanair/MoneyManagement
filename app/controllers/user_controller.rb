class UserController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.paginate(:per_page => 1, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { @users= User.all
      render xml: @users }
    end
  end
  def show
    @user = User.find(params[:id])
    @expenses = @user.expenses
    @spent=0
    @expenses.each {|loop| @spent = @spent +   loop.amount }
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render xml: @user }
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.xml { render xml: @user, status: :created, location: @user }
      redirect_to @user
    else
      render 'new'
    end
  end
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.xml { head :no_content }
          redirect_to @user
        else
          render 'edit'
        end
      end
   end

