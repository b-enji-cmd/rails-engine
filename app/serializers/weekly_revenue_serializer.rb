class WeeklyRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :week do |object|
  	object.week.strftime("%Y-%m-%d")
  end
  attribute :revenue do |object|
  	object.revenue.to_f
  end
end
