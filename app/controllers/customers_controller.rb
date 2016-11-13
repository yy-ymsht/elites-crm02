class CustomersController < ApplicationController
  def index
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
  end

  def update
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
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
