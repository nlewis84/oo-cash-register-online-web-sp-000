require 'pry'

class CashRegister
  attr_accessor :cart, :total, :discount, :last_transaction
  
  def initialize(discount = nil)
    @total = 0
    @cart = []
    @last_transaction = []
    @discount = discount
  end
  
  def add_item(title, price, quantity=1)
    @last_transaction = [title, price, quantity]
    @total += price * quantity
    
    quantity.times { @cart << title }
  end
  
  def apply_discount
    if discount != nil
      discount_deduct = @total * (discount.to_f / 100)
      @total -= discount_deduct.to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @cart
  end
  
  def void_last_transaction
    deduct = 0
    deduct += @last_transaction[1] * @last_transaction[2]
    @total -= deduct
  end
  
end

