class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :merchant_id

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  scope :find_by_name, -> (name) { where('name ILIKE ?', "%#{name}%")}
  scope :find_by_min_price, -> (price) { where('unit_price >= ?', price).order(:name)}
  scope :find_by_max_price, -> (price) { where('unit_price <= ?', price).order(:name)}
end
