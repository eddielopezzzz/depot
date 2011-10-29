class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]
  MONTHS = ["01","02","03","04","05","06","07","08","09","10","11","12"]
  validates :name, :creditcard, :year, :verification_value, :address, :email, :pay_type, :presence => true;
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :month, :inclusion => MONTHS
  has_many :line_items, :dependent => :destroy
  validate_on_create :validate_card
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => pay_type,
      :number             => creditcard,
      :verification_value => verification_value,
      :month              => month,
      :year               => year,
      :first_name         => name,
      :last_name          => name
    )
  end
end

