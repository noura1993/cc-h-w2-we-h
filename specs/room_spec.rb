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
        
        @guest1 = Guest.new("Rose", 120, @song1)
        @guest2 = Guest.new("Mike", 60, @song2)
        @guest3 = Guest.new("Harry", 500, @song1)
        @guest4 = Guest.new("Lily", 700, @song2)

        @drink1 = Drink.new("Coca Cola", 2)
        @drink2 = Drink.new("Pina Colada", 5)
        @drink3 = Drink.new("Secret Drink", 100)

        @room1 = Room.new("Crazy Room", 10, 65, @playlist)
        @room2 = Room.new("VIP Room", 2, 100, @playlist)

        @room1.bar.add_to_stock(@drink1)
        @room1.bar.add_to_stock(@drink1)
        @room1.bar.add_to_stock(@drink1)
        @room1.bar.add_to_stock(@drink2)
        @room1.bar.add_to_stock(@drink3)
    end

    def test_room_getters()
        assert_equal("Crazy Room", @room1.name)
        assert_equal(10, @room1.capacity)
        assert_equal(@playlist, @room1.playlist)
    end

    def test_check_in()
        @room1.check_in(@guest1)
        assert_equal([@guest1], @room1.guests)
        assert_equal(9, @room1.capacity)
        assert_equal(65, @room1.bar.total_fees)
        assert_equal(55, @guest1.wallet)
    end

    def test_check_in__cannot_afford()
        @room1.check_in(@guest2)
        assert_equal([], @room1.guests)
        assert_equal(10, @room1.capacity)
        assert_equal(0, @room1.bar.total_fees)
        assert_equal(60, @guest2.wallet)
    end

    def test_check_in__over_capacity()
        @room2.check_in(@guest1)
        @room2.check_in(@guest3)
        @room2.check_in(@guest4)
        assert_equal([@guest1, @guest3], @room2.guests)
        assert_equal(0, @room2.capacity)
        assert_equal(200, @room2.bar.total_fees)
        assert_equal(20, @guest1.wallet)
        assert_equal(400, @guest3.wallet)
        assert_equal([@guest4], @room2.waiting_list)
    end

    def test_play_next_song()
        @room1.check_in(@guest1)
        @room1.check_in(@guest3)
        assert_equal(@song1, @room1.play_next_song())
        assert_equal(@song2, @room1.play_next_song())
        assert_equal(@song3, @room1.play_next_song())
        assert_nil(nil)
    end

    def test_purchase_drink__can_afford()
        @room1.check_in(@guest1)
        @room1.purchase_drink(@guest1, @drink1)
        assert_equal(53, @guest1.wallet)
        assert_equal(2, @room1.bar.till)
        assert_equal(2, @room1.bar.stock_count(@drink1))
    end

    def test_purchase_drink__cannot_afford()
        @room1.check_in(@guest1)
        @room1.purchase_drink(@guest1, @drink3)
        assert_equal(60, @guest2.wallet)
        assert_equal(0, @room1.bar.till)
        assert_equal(1, @room1.bar.stock_count(@drink3))
    end

    def test_purchase_drink__not_in_room()
        @room1.purchase_drink(@guest2, @drink1)
        assert_equal(60, @guest2.wallet)
        assert_equal(0, @room1.bar.till)
        assert_equal(3, @room1.bar.stock_count(@drink1))
    end

    def test_check_out()
        @room2.check_in(@guest1)
        @room2.check_in(@guest3)
        @room2.check_in(@guest4)
        @room2.check_out(@guest1)
        assert_equal([@guest3, @guest4], @room2.guests)
        assert_equal(0, @room2.capacity)
        assert_equal(300, @room2.bar.total_fees)
        assert_equal(20, @guest1.wallet)
        assert_equal(400, @guest3.wallet)
        assert_equal(600, @guest4.wallet)
        assert_equal([], @room2.waiting_list)
    end

end