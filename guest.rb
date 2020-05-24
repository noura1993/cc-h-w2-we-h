class Guest
    attr_reader :name, :wallet

    def initialize(name, wallet, fav_song, wants_to_sing)
        @name = name
        @wallet = wallet
        @fav_song = fav_song
        @wants_to_sing = wants_to_sing
    end

    def can_afford(amount)
        return @wallet >= amount
    end

end