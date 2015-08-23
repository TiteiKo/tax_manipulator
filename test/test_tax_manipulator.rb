require 'minitest_helper'

class TestTaxManipulator < Minitest::Test
  def setup
    TaxManipulator.reset_config!
  end

  def test_that_it_has_a_version_number
    refute_nil ::TaxManipulator::VERSION
  end

  def test_that_for_returns_the_manipulator_without_config
    assert_raises TaxManipulator::UnknownStrategyError do
      TaxManipulator.for(12)
    end
    assert TaxManipulator.for(12, scheme: :incl_tax).class == TaxManipulator::Manipulator::IncludingTax
    assert TaxManipulator.for(12, scheme: :excl_tax).class == TaxManipulator::Manipulator::ExcludingTax
  end

  def test_that_for_returns_the_manipulator_with_config
    TaxManipulator.config.default_scheme = :excl_tax

    assert TaxManipulator.for(12).class == TaxManipulator::Manipulator::ExcludingTax
    assert TaxManipulator.for(12, scheme: :incl_tax).class == TaxManipulator::Manipulator::IncludingTax
  end

  def test_that_it_configures_rates
    TaxManipulator.configure do |config|
      config.add_rate rate: 20.0, starting: Date.parse('2014-01-01')
      config.add_rate rate: 19.6, ending: Date.parse('2013-12-31')
    end

    assert_equal 2, TaxManipulator.config.rates.size

    assert_equal 20.0, TaxManipulator.config.rates.first.rate
    assert_equal 19.6, TaxManipulator.config.rates.last.rate
  end

  def test_that_it_configures_default_scheme
    TaxManipulator.configure do |config|
      config.default_scheme = :incl_tax
    end
    assert_equal :incl_tax, TaxManipulator.config.default_scheme

    assert_raises TaxManipulator::UnknownStrategyError do
      TaxManipulator.configure do |config|
        config.default_scheme = :foo
      end
    end
  end
end
