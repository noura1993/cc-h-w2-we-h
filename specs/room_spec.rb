require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GuestTest < Minitest::Test

    def setup()
        @room = Room.new("Crazy Room", 10, 65)

        @song1 = Song.new("Roar")
        @song2 = Song.new("Hotel California")

        @guest1 = Guest.new("Rose", 120, @song1, true)
        @guest2 = Guest.new("Mike", 60, @song2, false)

        @drink1 = Drink.new("Coca Cola", 2)
        @drink2 = Drink.new("Pina Colada", 5)
    end

    def test_room_getters()
        assert_equal("Crazy Room", @room.name)
        assert_equal(10, @room.capacity)
    end

end