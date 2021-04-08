module RequestSpecHelper

	def setup_five_merchants_revenue
	    merchant_1_with_history
	    merchant_2_with_history
	    merchant_3_with_history
	    merchant_4_with_history
	    merchant_5_with_history
	  end
	  def merchant_1_with_history
	    @merchant_1 = create(:merchant, name: 'Merchant 1')
	    @customer_1 = create(:customer)
	    @item_1 = create(:item, unit_price: 10, merchant_id: @merchant_1.id)
	    @invoice_1 = create(:invoice, customer_id: @customer_1.id, status: "shipped", merchant_id: @merchant_1.id)
	    @invoice_item_1 = create(:invoice_item, invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 1, unit_price: 10)
	    @transaction_1 = create(:transaction, invoice_id: @invoice_1.id, result: 'success')
	  end
	  def merchant_2_with_history
	    @merchant_2 = create(:merchant, name: 'Merchant 2')
	    @customer_2 = create(:customer)
	    @item_2 = create(:item, unit_price: 10, merchant_id: @merchant_2.id)
	    @invoice_2 = create(:invoice, customer_id: @customer_2.id, status: "shipped", merchant_id: @merchant_2.id)
	    @invoice_item_2 = create(:invoice_item, invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 2, unit_price: 20)
	    @transaction_2 = create(:transaction, invoice_id: @invoice_2.id, result: 'success')
	  end
	  def merchant_3_with_history
	    @merchant_3 = create(:merchant, name: 'Merchant 3')
	    @customer_3 = create(:customer)
	    @item_3 = create(:item, unit_price: 20, merchant_id: @merchant_3.id)
	    @invoice_3 = create(:invoice, customer_id: @customer_3.id, status: "shipped", merchant_id: @merchant_3.id)
	    @invoice_item_3 = create(:invoice_item, invoice_id: @invoice_3.id, item_id: @item_3.id, quantity: 3, unit_price: 30)
	    @transaction_3 = create(:transaction, invoice_id: @invoice_3.id, result: 'success')
	  end
	  def merchant_4_with_history
	    @merchant_4 = create(:merchant, name: 'Merchant 4')
	    @customer_4 = create(:customer)
	    @item_4 = create(:item, unit_price: 10, merchant_id: @merchant_4.id)
	    @item_5 = create(:item, unit_price: 20, merchant_id: @merchant_4.id)
	    @invoice_4 = create(:invoice, customer_id: @customer_4.id, status: "shipped", merchant_id: @merchant_4.id)
	    @invoice_5 = create(:invoice, customer_id: @customer_4.id, status: "shipped", merchant_id: @merchant_4.id)
	    @invoice_item_4 = create(:invoice_item, invoice_id: @invoice_4.id, item_id: @item_4.id, quantity: 4, unit_price: 40)
	    @invoice_item_5 = create(:invoice_item, invoice_id: @invoice_5.id, item_id: @item_5.id, quantity: 4, unit_price: 40)
	    # Note first @transaction_ = is faie:transaction, d
	    @transaction_4 = create(:transaction, invoice_id: @invoice_4.id, result: 'failed')
	    @transaction_5 = create(:transaction, invoice_id: @invoice_5.id, result: 'success')
	  end
	  def merchant_5_with_history
	    @merchant_5 = create(:merchant, name: 'Merchant 5 The Homie')
	    @customer_5 = create(:customer)
	    @item_6 = create(:item, unit_price: 10, merchant_id: @merchant_5.id)
	    @item_7 = create(:item, unit_price: 20, merchant_id: @merchant_5.id)
	    @invoice_6 = create(:invoice, customer_id: @customer_5.id, status: "shipped", merchant_id: @merchant_5.id)
	    @invoice_7 = create(:invoice, customer_id: @customer_5.id, status: "shipped", merchant_id: @merchant_5.id)
	    @invoice_item_6 = create(:invoice_item, invoice_id: @invoice_6.id, item_id: @item_6.id, quantity: 5, unit_price: 50)
	    @invoice_item_7 = create(:invoice_item, invoice_id: @invoice_7.id, item_id: @item_6.id, quantity: 5, unit_price: 50)
	    # Note second @transaction_ = is faie:transaction, d
	    @transaction_6 = create(:transaction, invoice_id: @invoice_6.id, result: 'success')
	    @transaction_7 = create(:transaction, invoice_id: @invoice_7.id, result: 'failed')
	  end
	  def merchant_6_with_history
	    @merchant_6 = create(:merchant, name: 'Merchant 6')
	    @customer_6 = create(:customer)
	    @item_8 = create(:item, unit_price: 1000, merchant_id: @merchant_6.id)
	    @invoice_8 = create(:invoice, customer_id: @customer_6.id, status: "shipped", merchant_id: @merchant_6.id)
	    @invoice_item_8 = create(:invoice_item, invoice_id: @invoice_8.id, item_id: @item_8.id, quantity: 100, unit_price: 10000)
	    @transaction_8 = create(:transaction, invoice_id: @invoice_8.id, result: 'success')
	  end

	def json
		JSON.parse(response.body)
	end
end
