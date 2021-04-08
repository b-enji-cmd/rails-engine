class ItemsSoldSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  attribute :count do |object|
  	object.amount.to_i
  end
end
