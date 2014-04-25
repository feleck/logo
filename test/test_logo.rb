require 'test/unit'
require_relative '../lib/logo'

class MyUnitTests < Test::Unit::TestCase

  def setup
    @logo = Logo.new(5)
  end
  
  def test_calc
    assert_equal(3, @logo.calc(2, 1))
    assert_equal(2, @logo.calc(3, -1))
  end

  def test_valid_command?
    command = ['l', 2]
    assert_equal(true, @logo.valid_command?(command))
    command = ['l', 3]
    assert_equal(false, @logo.valid_command?(command))
    command = ['u', 1]
    assert_equal(true, @logo.valid_command?(command))
    command = ['u', 4]
    assert_equal(false, @logo.valid_command?(command))
  end

  def test_calculate_path
    command = ['l', 2]
    assert_equal([[1, 2], [0, 2]], @logo.calculate_path(command))
    
    command = ['u', 1]
    assert_equal([[2, 1]], @logo.calculate_path(command))
    
    @logo.path = [[1, 1], [0, 0]]
    command = ['d', 1]
    assert_equal([[0, 1]], @logo.calculate_path(command))
  end

end