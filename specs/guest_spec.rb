require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GuestTest < Minitest::Test

    def setup()
        @song1 = Song.new("Roar")
        @song2 = Song.new("Hotel California")
        @guest1 = Guest.new("Rose", 120, @song1, true)
        @guest2 = Guest.new("Mike", 60, @song2, false)
    end

    def test_guest_name_and_wallet()
        assert_equal("Rose", @guest1.name)
        assert_equal(120, @guest1.wallet)
    end

    def test_can_afford__true()
        result = @guest1.can_afford(65)
        assert_equal(true, result)
    end

    def test_can_afford__false()
        result = @guest2.can_afford(65)
        assert_equal(false, result)
    end

    def test_withdraw()
        @guest1.withdraw(65)
        assert_equal(55, @guest1.wallet)
    end

    def test_cheer()
        result = @guest1.cheer(@song1)
        assert_equal("Whoo!", result)
    end

    def test_no_cheer()
        result = @guest2.cheer(@song1)
        assert_nil(result)
    end


end
