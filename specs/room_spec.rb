require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')
require_relative('../bar')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RoomTest < Minitest::Test

    def setup()
        @song1 = Song.new("Roar")
        @song2 = Song.new("Hotel California")
        @song3 = Song.new("Cheap Thrills")

        @playlist = [@song1, @song2, @song3]
        
        @guest1 = Guest.new("Rose", 120, @song1, true)
        @guest2 = Guest.new("Mike", 60, @song2, false)

        @drink1 = Drink.new("Coca Cola", 2)
        @drink2 = Drink.new("Pina Colada", 5)

        @room = Room.new("Crazy Room", 10, 65, @playlist)

        @room.bar.add_to_stock(@drink1)
        @room.bar.add_to_stock(@drink1)
        @room.bar.add_to_stock(@drink1)
        @room.bar.add_to_stock(@drink2)
    end

    def test_room_getters()
        assert_equal("Crazy Room", @room.name)
        assert_equal(10, @room.capacity)
        assert_equal(@playlist, @room.playlist)
    end

    def test_check_in()
        @room.check_in(@guest1)
        assert_equal([@guest1], @room.guests)
        assert_equal(9, @room.capacity)
        assert_equal(65, @room.bar.total_fees)
        assert_equal(55, @guest1.wallet)
    end

end