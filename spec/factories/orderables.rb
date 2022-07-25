FactoryBot.define do
  factory :orderable do
    workshop { nil }
    cart { nil }
    quantity { 1 }
  end
end
