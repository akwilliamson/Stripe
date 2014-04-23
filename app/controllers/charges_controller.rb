class ChargesController < ApplicationController
  def new
  end

  def create
    Stripe.api_key = "sk_test_SewUriofu2nYsMNOgpklMT9t"
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => 1000,
        :currency => "usd",
        :card => token,
      )
    rescue Stripe::CardError => e
    end
  end
end
