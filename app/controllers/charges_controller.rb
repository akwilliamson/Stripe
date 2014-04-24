class ChargesController < ApplicationController
  def new
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
  end

  def create



# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://manage.stripe.com/account
Stripe.api_key = "sk_test_SewUriofu2nYsMNOgpklMT9t"

# Get the credit card details submitted by the form
token = params[:stripeToken]
amount = params[:amount].to_i * 100
# Create the charge on Stripe's servers - this will charge the user's card
begin

  charge = Stripe::Charge.create(
    :amount => amount, # amount in cents, again
    :currency => "usd",
    :card => token,
    :description => "payinguser@example.com"
  )
  redirect_to root_path
rescue Stripe::CardError => e
  # The card has been declined
end



  end
end
