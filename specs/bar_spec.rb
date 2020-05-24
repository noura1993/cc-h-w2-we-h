require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BarTest < Minitest::Test

    def setup()
        @bar = Bar.new()
    end

    def test_increase_entry_fees()  
        @bar.increase_entry_fees(30)
        assert_equal(30, @bar.total_fees)
    end
end