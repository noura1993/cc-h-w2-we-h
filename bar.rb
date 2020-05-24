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

end