class HoliController < ApplicationController
  layout ''
  def crear
    # redirect_to holi_actualizar_path
    redirect_to yepeto_path(name: 'simon')
  end

  def actualizar
    # redirect_to products_path
    redirect_to products_url
  end

  def ver
    @name = params[:name]
    @products = ['Mac', 'Pc', 'Guaro']
    render layout: 'custom_products'
  end

  def products
    @products = [
      {name: 'telefono'},
      {name: 'audifono'}
    ]
    render json: @products
  end
end
