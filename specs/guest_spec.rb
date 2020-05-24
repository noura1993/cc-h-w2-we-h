require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class GuestTest < Minitest::Test

    def setup()
        @guest1 = Guest.new("Rose", 120, "Roar", true)
        @guest2 = Guest.new("Mike", 60, "Hotel California", false)
    end

    def test_guest_name_and_wallet()
        assert_equal("Rose", @guest1.name)
        assert_equal(120, @guest1.wallet)
    end

end
