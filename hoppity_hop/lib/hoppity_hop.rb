class BadData < Exception; end

class HoppityHop
  
  def initialize(number)
    @number = number.to_f
    raise BadData.new("Your number must be greater than 0") if @number <= 0
  end
    
  def hop_away!
    1.upto(@number) do |number|
      @number_to_check = number   
      if hop?
        puts "Hop\n"
      elsif hoppity?
        puts "Hoppity\n"
      elsif hop_hop?
        puts "Hophop\n"
      end
    end  
  end
  
  private
  
  def hoppity?
    @number_to_check % 3 == 0 ? true : false
  end
  
  def hop_hop?
    @number_to_check % 5 == 0 ? true : false
  end
  
  def hop?
    hoppity? && hop_hop?
  end
    
end