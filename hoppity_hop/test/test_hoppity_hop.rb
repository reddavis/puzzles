require File.dirname(__FILE__) + '/../lib/hoppity_hop'
require 'test/unit'
require 'stringio'

class TestHoppityHop < Test::Unit::TestCase
  
  def test_number_six
    $stdout = StringIO.new
    a = HoppityHop.new(6).hop_away!
    expected_output = "Hoppity\nHophop\nHoppity\n"
    assert_equal(expected_output, $stdout.string)
  end
  
  def test_number_one
    $stdout = StringIO.new
    a = HoppityHop.new(1).hop_away!
    expected_output = ""  
    assert_equal(expected_output, $stdout.string)
  end

end