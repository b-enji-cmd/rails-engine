class Merchant < ApplicationRecord



  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(quantity)
    Merchant.joins(invoices: [:transactions,:invoice_items] )
            .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
            .where(transactions: { result: 'success' }, invoices: { status: 'shipped' })
            .group(:id)
            .order(revenue: :desc)
            .limit(quantity)
  end

  def self.most_items(quantity = 5)
    Merchant.joins(invoices: [:transactions,:invoice_items] )
            .select('merchants.*, SUM(invoice_items.quantity) AS amount')
            .where(transactions: { result: 'success' }, invoices: { status: 'shipped' })
            .group(:id)
            .order(amount: :desc)
            .limit(quantity)
  end

  def self.total_revenue(merchant_id)
     Merchant.joins(invoices: %i[transactions invoice_items])
             .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
             .where(merchants: { id: merchant_id },transactions: { result: 'success' },invoices: { status: 'shipped' })
             .group(:id)
             .first!
  end

  def self.weekly_revenue
  	Merchant.joins(invoices: [:transactions,:invoice_items] )
  					.select("date_trunc('week',invoices.created_at::date) AS week, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
  					.where(transactions: { result: 'success' }, invoices: { status: 'shipped' })
  					.group(:week)
  					.order(:week)
  end
end
