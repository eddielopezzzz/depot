class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
  validates :name, :creditcard, :month, :year, :verification_value, :address, :email, :pay_type, :presence => true;
  validates :pay_type, :inclusion => PAYMENT_TYPES
  has_many :line_items, :dependent => :destroy
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  def check_credit_card(order)
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number =>  order.creditcard,
      :month => order.month,
      :year => order.year,
      :first_name => order.name,
      :last_name => order.name,
      :verification_value => order.verification_value
    )
    if credit_card.valid?
      return true
    else
      return false
    end
  end
end

