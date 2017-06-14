class InvoicesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    invoice = params
      .require(:invoice)
      .permit(:total, :status, :order_id)
    @invoice = Invoice.new invoice
    @invoice.user = current_user
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  def show
    begin
      @invoice = Invoice.find params[:id]
    rescue ActiveRecordNotFound
      # render :not_found
      redirect_to invoices_path
    end
  end

  def edit
    begin
      @invoice = Invoice.find params[:id]
    rescue ActiveRecordNotFound
      # render :not_found
      redirect_to invoices_path
    end
  end

  def update
    @invoice = Invoice.find params[:id]
    invoice = params
      .require(:invoice)
      .permit(:total, :user_id, :status, :order_id)
    # @invoice.update_attributes invoice
    @invoice.total = invoice[:total]
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :edit
    end
  end

  def destroy
    @invoice = Invoice.detroy params[:id]
  end
end
