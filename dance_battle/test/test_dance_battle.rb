require File.dirname(__FILE__) + '/../lib/dance_battle'
require 'test/unit'

class TestDanceBattle < Test::Unit::TestCase
  
  def test_number_of_moves_available
    a = setup_battle(3, [[0, 0], [0, 1]])
    a.i_win?
    puts a.dances_performed.inspect
    assert_equal(6, a.dances)
  end
  
  def test_i_should_win
    a = setup_battle(3, [[0, 0], [0, 1]])
    assert_equal(true, a.i_win?)
  end
  
  def test_i_should_loose
    a = setup_battle(2, [[0, 0], [0, 1]])
    assert_equal(false, a.i_win?)
  end
  
  private
  
  def setup_battle(total_moves, moves=[])
    battle = DanceBattle.new
    battle.moves_allowed = total_moves
    moves.each {|move| battle << move}
    battle
  end
  
end