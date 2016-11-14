class CustomersController < ApplicationController
  def index
    #@customers = Customer.all
    # 上記の内容を下記に変更
    @customers = Customer.page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
      )
  end
end
