class Room 
    attr_reader :name, :capacity, :playlist, :guests, :bar, :waiting_list

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
        if(guest.can_afford(@entry_fee))
            if(@capacity > 0)
                @guests.push(guest)
                @capacity -= 1
                @bar.increase_entry_fees(@entry_fee)
                guest.withdraw(@entry_fee)
            else
                @waiting_list.push(guest)
            end
        end
    end

end

