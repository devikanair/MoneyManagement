class ExpensesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def create
    @expense = current_user.expenses.build(params[:expense])
    if @expense.save
      redirect_to root_url
    else
      render root_url
    end
  end

  def destroy
    @expense = current_user.expenses.find_by_id(params[:id])
    @expense.destroy
    redirect_to root_url
  end

end
