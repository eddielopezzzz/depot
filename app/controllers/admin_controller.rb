class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @user_name = User.find(session[:user_id]).name
  end

end
