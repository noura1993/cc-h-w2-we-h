require('minitest/autorun')
require('minitest/reporters')
require_relative('../drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class DrinkTest < Minitest::Test

    def setup()
        @drink = Drink.new("Coca Cola", 2)
    end

    def test_drink_name()
        assert_equal("Coca Cola", @drink.name)
    end

    def test_drink_price()
        assert_equal(2, @drink.price)
    end

end
