class IllegalMove < Exception; end
class InvalidData < Exception; end

class DanceBattle
  attr_reader :moves_allowed
  
  # Sets the ball rolling
  def i_win?
    raise InvalidData.new("You need to perform at least one dance") if dances_performed.empty?
    play_the_game
    # If dances are even number you win
    dances % 2 == 0 ? true : false
  end
  
  # Total number of dances performed
  # A dance is a pair of moves [0,1] is a dance
  def dances_performed
    @dances_performed ||= []
  end
  
  # The number of moves allowed
  def moves_allowed=(amount)
    @moves_allowed = amount.to_i
    raise InvalidData.new("They need at least once dance to dance") if @moves_allowed == 0
  end
  
  def <<(move)
    if !move.is_a?(Array) || move.size > 2 || !move_allowed?(move)
      raise IllegalMove.new("Uh oh, looks like you have already danced that dance")
    end
    dances_performed << move
  end
  
  def last_move
    @dances_performed[-1][1]
  end
    
  # Amount of dances that have been performed
  def dances
    @dances_performed.size
  end
  
  private
  
  # This is where most stuff happens.
  # To get the most amount of moves you want to do a double ([1,1])
  # So a double is checked first.
  # If a double cant be done a 'scan_through' is performed.
  def play_the_game
    looped = 0
    until looped > 1 do
      if move_allowed?(two_in_a_row)
        self << two_in_a_row
      elsif a = scan_through
        self << a
      else
        looped += 1
      end
    end
  end
  
  # Will try to match the last move with any number
  # When a number is found it is returned, other wise it returns false
  def scan_through
    moves_allowed.times do |i|
      move = [last_move, i]
      if move_allowed?(move)
        return move
      else
        next
      end
    end
    false
  end
  
  # If we already have [[0,1]] we cant have [1,0]
  def move_allowed?(move)
    !dances_performed.include?(move) && !dances_performed.include?(move.reverse)
  end
  
  def two_in_a_row
    [last_move,last_move]
  end
  
end