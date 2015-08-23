require 'minitest_helper'

class TestTaxManipulatorRate < Minitest::Test
  def test_that_rate_without_ending_matches_dates
    rate = TaxManipulator::Rate.new(rate: 1, starting: Date.parse('2015-01-01'))

    assert rate.match?(Date.parse('2015-01-01')), 'date == starting'
    assert rate.match?(Date.parse('2017-12-10')), 'date > starting'
    refute rate.match?(Date.parse('2014-12-31')), 'date == starting - 1'
    refute rate.match?(Date.parse('1920-12-23')), 'date < starting'
  end

  def test_that_rate_without_starting_matches_dates
    rate = TaxManipulator::Rate.new(rate: 1, ending: Date.parse('2014-12-31'))

    assert rate.match?(Date.parse('2014-12-31')), 'date == ending'
    assert rate.match?(Date.parse('2010-12-10')), 'date < ending'
    refute rate.match?(Date.parse('2015-01-01')), 'date == ending + 1'
    refute rate.match?(Date.parse('2070-12-30')), 'date > ending'
  end

  def test_that_rate_with_both_dates_matches_dates
    rate = TaxManipulator::Rate.new(rate: 1, starting: Date.parse('2015-01-01'), ending: Date.parse('2015-02-01'))

    assert rate.match?(Date.parse('2015-01-01')), 'date == starting'
    assert rate.match?(Date.parse('2015-01-01')), 'date == ending'
    refute rate.match?(Date.parse('2014-12-31')), 'date == starting - 1'
    refute rate.match?(Date.parse('2015-02-02')), 'date == ending + 1'
  end

  def test_that_rate_without_dates_match
    rate = TaxManipulator::Rate.new(rate: 1)

    assert rate.match?(Date.today)
  end
end
