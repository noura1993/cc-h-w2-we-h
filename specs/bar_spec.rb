require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar')
require_relative('../drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BarTest < Minitest::Test

    def setup()
        @bar = Bar.new()
        @drink = Drink.new("Coca Cola", 2)
    end

    def test_increase_entry_fees()  
        @bar.increase_entry_fees(30)
        assert_equal(30, @bar.total_fees)
    end

    def test_increase_till()  
        @bar.increase_till(@drink)
        assert_equal(2, @bar.till)
    end

    def test_add_to_stock()  
        @bar.add_to_stock(@drink)
        @bar.add_to_stock(@drink)
        assert_equal(2, @bar.stock_count(@drink))
    end

    def test_unavailable_stock()  
        assert_equal(0, @bar.stock_count(@drink))
    end

    def test_decrease_stock()  
        @bar.add_to_stock(@drink)
        @bar.add_to_stock(@drink)
        @bar.decrease_stock(@drink)
        assert_equal(1, @bar.stock_count(@drink))
    end

end