class Room 
    attr_reader :name, :capacity, :playlist, :guests, :bar

    def initialize(name, capacity, entry_fee, playlist)
        @name = name 
        @capacity = capacity
        @entry_fee = entry_fee
        @playlist = playlist
        @guests = []
        @waiting_list = []
        @bar = Bar.new()
    end

    def check_in(guest)
        @guests.push(guest)
        @capacity -= 1
        @bar.increase_entry_fees(@entry_fee)
        guest.withdraw(@entry_fee)
    end

end