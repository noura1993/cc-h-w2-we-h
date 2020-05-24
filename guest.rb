class Guest
    attr_reader :name, :wallet, :wants_to_sing

    def initialize(name, wallet, fav_song, wants_to_sing)
        @name = name
        @wallet = wallet
        @fav_song = fav_song
        @wants_to_sing = wants_to_sing
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