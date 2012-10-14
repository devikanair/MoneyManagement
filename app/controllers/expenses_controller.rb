#Classes for expenses controller
#
class ExpensesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def create
    @expense = current_user.expenses.build(params[:expense])
    if @expense.save
      redirect_to current_user
    else
      render current_user
    end
  end

  def destroy
    @expense = current_user.expenses.find_by_id(params[:id])
    @user =current_user
    @cash = current_user.cash - @expense.amount
    @user.update_column(:cash,@cash)
    @expense.destroy
    redirect_to current_user
  end

  def show
    @expense = current_user.expenses.find_by_id(params[:id])
    current_user.cash = current_user.cash - @expense.amount
    current_user.save
    @expense.destroy
    redirect_to current_user
  end

end
