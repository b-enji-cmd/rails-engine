class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  # def ordered_items_to_ship
  #   item_ids = InvoiceItem.where("status = 0 OR status = 1").order(:created_at).pluck(:item_id)
  #   item_ids.map do |id|
  #     Item.find(id)
  #   end
  # end

  def self.top_merchants
    joins(invoices: [:invoice_items, :transactions])
    .where('result = ?', 1)
    .select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue')
    .group(:id)
    .order('total_revenue DESC')
    .limit(5)
  end
end
