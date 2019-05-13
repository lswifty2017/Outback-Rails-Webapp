class ChargesController < ApplicationController
  
  def new
  end
  
  def create
    # Amount in cents
  begin
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: 2700,
      description: 'Rails Stripe customer',
      currency: 'aud',
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
  redirect_to new_charge_path
  end
  
end
