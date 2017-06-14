class IndexController < ApplicationController
  def holi

  end

  def search
    @user = User
      .includes(:orders)
      .includes(orders: :prodcuts)
      .find_by email: params[:email]
    render :index
  end

  def root
    render 'holi'
  end
end
