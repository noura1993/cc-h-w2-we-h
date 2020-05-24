class Bar
    attr_reader :total_fees, :till

    def initialize()
        @total_fees = 0
        @till = 0
        @stock = Hash.new()
    end

    def increase_entry_fees(amount)
        @total_fees += amount
    end

    def increase_till(drink)
        @till += drink.price
    end

    def add_to_stock(drink)
        if(@stock.include?(drink))
            @stock[drink] += 1
        else
            @stock[drink] = 1
        end
    end

    def stock_count(drink)
        return 0 if(!@stock.include?(drink))
        return @stock[drink]
    end

    def decrease_stock(drink)
        # if(!@stock.include?(drink))  
        @stock[drink] -= 1
    end
end