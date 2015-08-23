require 'minitest_helper'

class TestBaseManipulator < Minitest::Test
  def setup
    TaxManipulator.reset_config!
    TaxManipulator.configure do |config|
      config.add_rate rate: 3, starting: Date.parse('2015-01-01')
      config.add_rate rate: 2, starting: Date.parse('2014-01-01'), ending: Date.parse('2014-12-31')
      config.add_rate rate: 1, ending: Date.parse('2013-12-31')
    end
  end

  def test_that_it_takes_the_right_rate
    assert_equal 0.03, TaxManipulator::Manipulator::Base.new(12, Date.parse('2017-10-12')).rate
    assert_equal 0.02, TaxManipulator::Manipulator::Base.new(12, Date.parse('2014-08-10')).rate
    assert_equal 0.01, TaxManipulator::Manipulator::Base.new(12, Date.parse('2010-10-12')).rate
  end
end
