require 'pry'

class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :last_item 

    def initialize(discount = 0) 
        @total = 0
        @discount = discount
        @items = [] 
    end 

    def add_item(item_name, price, quantity = 1)
        @last_item = Item.new(item_name, price, quantity)
        self.items.fill(item_name, self.items.length, quantity)
        self.total += (price * quantity)
    end 

    def apply_discount
        if @discount > 0 
            self.total *= (1 - @discount/100.to_f)
            self.total = @total.to_i
            "After the discount, the total comes to $#{total.to_s}."
        else
            "There is no discount to apply."
        end
    end 

    def void_last_transaction 
       self.total -= last_item.price * last_item.quantity
    end 
    
end 

class Item 
    attr_reader :name, :price, :quantity

    def initialize(item_name, price, quantity = 1)
        @name = item_name
        @price = price 
        @quantity = quantity
    end 
end 
