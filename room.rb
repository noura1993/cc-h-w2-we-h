class Room 
    attr_reader :name, :capacity

    def initialize(name, capacity, entry_fee)
        @name = name 
        @capacity = capacity
        @entry_fee = entry_fee
        @playlist = []
        @guests = []
        @waiting_list = []
    end
end