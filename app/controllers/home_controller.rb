class HomeController < ApplicationController
  def help
    # This is executed before rendering the page home#help
    # Useful for putting your logic in
  end

  def about
  end

  def home
    @expenses = current_user.expenses.build if signed_in?
  end
end
