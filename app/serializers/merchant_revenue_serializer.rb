class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |object|
  	object.revenue.to_f.round(2)
  end
end
