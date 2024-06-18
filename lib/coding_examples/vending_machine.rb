class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Inventory
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_products(product, quantity)
    quantity.times { @products << product }
  end

  def remove_product(product)
    @products.delete(product)
  end
end

class MoneyHandler
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def insert_money(amount)
    @balance += amount 
  end

  def deduct_money(amount)
    @balance -= amount 
  end
end

class VendingMachine
  def initialize
    @inventory = Inventory.new
    @money_handler = MoneyHandler.new
    @slected_product = nil
  end

  def add_products(product, quantity)
    @inventory.add_products(product, quantity)
  end

  def insert_money(amount)
    @money_handler.insert_money(amount)
  end

  def select_product(product_name)
    @slected_product = @inventory.products.find{|p| p.name == product_name}
  end

  def purchase    
    if @slected_product
      if @slected_product.price <= @money_handler.balance
        @inventory.remove_product(@slected_product)
        @money_handler.deduct_money(@slected_product.price)
        change = @money_handler.balance
        @money_handler.balance = 0
        puts "You have purchased the selected product successfully"
        puts "Retuned the change #{change}"
      else
        puts "There is no sufficient balance to purchase this product"  
      end
    else
      puts "The slected product is out of stock"
    end
  end

  # def return_change
    # current_balance = @money_handler.balance
    # current_balance - @slected_product.price
  # end
end

prod = Product.new('apple', 3)
vm = VendingMachine.new
vm.add_products(prod, 3)


vm.insert_money(5)
vm.select_product('apple')
vm.purchase
# res = inv.products
# puts res

