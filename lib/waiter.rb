class Waiter
    
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self    
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        # orders remain the same - waiter, customer, a total and a tip
        Meal.new(self, customer, total, tip)
    end

    #keep track of the meals they've served
    def meals
        Meal.all.select do |meal|
            meal.waiter == self #checking for waiter now
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end

        best_tipped_meal.customer
    end

    # jason = Waiter.new("Jason", 4)
    # lisa = Customer.new("Lisa", 24)
    # tim = Customer.new("Tim", 35)
    # terrance = Customer.new("Terrance", 27)

    # terrance.new_meal(jason, 50, 3)
    # lisa.new_meal(jason, 40, 10)
    # tim.new_meal(jason, 45, 8)

    # jason.best_tipper #=> #<Customer:0x00007f80829959a8 @name="Lisa", @age=24>
    # jason.best_tipper.name #=> "Lisa"

    #Bonus
    
end

# Notice neither the Customer class, nor the Waiter class needed  additional attributes --
# they don't need to keep track of this information
# Meal class: the join between customer and waiter