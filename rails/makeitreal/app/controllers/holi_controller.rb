class HoliController < ApplicationController
  def crear
  end

  def actualizar
  end

  def ver
    @name = params[:name]
  end

  def products
    @products = [
      {name: 'telefono'},
      {name: 'audifono'}
    ]
    render json: @products
  end
end
