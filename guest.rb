class Guest
    attr_reader :name, :wallet

    def initialize(name, wallet, fav_song)
        @name = name
        @wallet = wallet
        @fav_song = fav_song
    end

    def can_afford(amount)
        return @wallet >= amount
    end

    def withdraw(amount)
        @wallet -= amount if can_afford(amount)
    end

    def cheer(song)
        return "Whoo!" if @fav_song == song
    end

end