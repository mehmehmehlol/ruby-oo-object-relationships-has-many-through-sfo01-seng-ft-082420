class Meal
    attr_accessor :waiter, :customer, :total, :tip

    # Single source of truth: not only the total cost and tips 
    # Also, who the customer and waiter were for each meal
    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        
        @@all << self
    end

    def self.all 
        @@all
    end

end