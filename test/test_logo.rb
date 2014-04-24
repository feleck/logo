require 'test/unit'
require_relative '../lib/logo'

class MyUnitTests < Test::Unit::TestCase

  def test_calc
    logo = Logo.new(5)
    assert_equal(3, logo.calc(2, 1))
    assert_equal(2, logo.calc(3, -1))
  end

   def test_valid_command?
    logo = Logo.new(5)
    command = ['l', 2]
    assert_equal(true, logo.valid_command?(command))
    command = ['l', 3]
    assert_equal(false, logo.valid_command?(command))
    command = ['u', 1]
    assert_equal(true, logo.valid_command?(command))
    command = ['u', 4]
    assert_equal(false, logo.valid_command?(command))
 
  end

  def test_calculate_path
    logo = Logo.new(7)
    command = ['l', 2]
    assert_equal([[3, 2], [3, 1]], logo.calculate_path(command))
    command = ['u', 1]
    assert_equal([[2, 3]], logo.calculate_path(command))

    logo.path = [[1, 1], [0, 0]]
    command = ['d', 3]
    assert_equal([[1, 0], [2, 0], [3, 0]], logo.calculate_path(command))

  end

end