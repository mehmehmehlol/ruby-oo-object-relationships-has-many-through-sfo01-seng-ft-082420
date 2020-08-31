class Customer
    # accessor for both, the customer can change their name or age
    attr_accessor :name, :age

    @@all = []

    # customer instance has a name and an age
    def initialize(name, age)
        @name = name
        @age = age

        @@all << self
    end

    def self.all
        @@all
    end

    # Create a meal by taking in an instance of a watier and supply the total and the tip
    # self: create new meals as a customer
    # automatically assoicate each new meal with the customer that created it
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    # iterate every instance of Meal and returning only the ones where the meal's customer matches the current customer instance
    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    # use the #meals method to get an array of meals, let's say by Rachel
    # return the waiters that have served, let's say Rachel
    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end

    # terrance = Customer.new("Terrance", 27)
    # jason = Waiter.new("Jason", 4)
    # andrew = Waiter.new("Andrew", 7)
    # yomi = Waiter.new("Yomi", 10)

    # terrance.new_meal(jason, 50, 6)
    # terrance.new_meal(andrew, 60, 8)
    # terrance.new_meal(yomi, 30, 4)

    # if let's say Terrance, wanted to find the name of his last waiter,
    # he can use the #waiters method
    # terrance.waiters.last.name

    # Bonus
    # def new_meal_20_percent(waiter, total)
    #     tip = total * 0.2
    #     Meal.new(waiter, self,total, tip)
    # end

    # def self.oldest_customer
    #     oldest_age = 0
    #     oldest_customer = nil
    #     self.all.each.do |customer|
    #         if customer.age > oldest_age
    #             oldest_age = customer.age
    #             oldest_customer = customer
    #         end
    #     end
    #     oldest_customer
    # end
end
