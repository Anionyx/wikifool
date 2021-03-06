def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key]}",
    description: "BigMoney Membership - #{current_user.name}",
    amount: 1_000
  }
end






def create

  @amount = params[:amount]


  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )

  flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
  redirect_to_user_path(current_user)



rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to_new_charge_path
end