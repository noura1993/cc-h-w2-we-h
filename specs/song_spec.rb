require('minitest/autorun')
require('minitest/reporters')
require_relative('../song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SongTest < Minitest::Test

    def test_song_name()
        song = Song.new("Roar")
        assert_equal("Roar", song.name)
    end

end
