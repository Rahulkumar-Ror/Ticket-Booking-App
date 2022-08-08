Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_51L0KIdFw4uYMCAh0CH8SUDFYi3CEb6p52Gem2meb3IolGMrgFWHgjjXXYUfdBR1EEkjQdHHNgwYMQzelUKIAjozk002sxhCwGD', 
  :secret_key => 'sk_test_51L0KIdFw4uYMCAh0NYpyP9SUraWCy4F6DpuDFu7HS31QQM6iMwUvuguqppF6FOibgFVM442h3RllBgJ7ZZ2cJ1Th00tJr0tTAw'
}   

Stripe.api_key = Rails.configuration.stripe[:secret_key]
