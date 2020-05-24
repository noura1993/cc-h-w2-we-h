class Room 
    attr_reader :name, :capacity, :playlist, :guests, :bar, :waiting_list

    def initialize(name, capacity, entry_fee, playlist)
        @name = name 
        @capacity = capacity
        @entry_fee = entry_fee
        @playlist = playlist
        @guests = []
        @current_song_index = 0
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

    def play_next_song()
        current_song = @playlist[@current_song_index]

        @guests.each do |guest| 
            cheer = guest.cheer(current_song)
            if(cheer != nil)
                p "#{guest.name} said #{cheer}"
            end
        end

        @current_song_index += 1
        return current_song
    end

    def purchase_drink(guest, drink)
        if(@guests.include?(guest) && guest.can_afford(drink.price) && @bar.stock_count(drink) > 0)
            @bar.increase_till(drink)
            guest.withdraw(drink.price)
            @bar.decrease_stock(drink)
        end
    end

    def check_out(guest)
        if(@guests.include?(guest))
            index = @guests.index(guest)
            @guests.delete_at(index)
            @capacity += 1
            if(@waiting_list.length != 0)
                next_guest = @waiting_list.shift()
                check_in(next_guest)
            end
        end
    end

end

