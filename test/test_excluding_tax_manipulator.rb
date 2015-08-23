require 'minitest_helper'

class TestExcludingTaxManipulator < Minitest::Test
  def setup
    TaxManipulator.reset_config!
    TaxManipulator.configure do |config|
      config.add_rate rate: 10
      config.default_scheme = :excl_tax
    end
  end

  def test_that_it_computes_the_vat_correctly
    assert_equal 12.0, TaxManipulator.for(120).vat
  end

  def test_that_it_computes_the_price_incl_tax_correctly
    assert_equal 132.0, TaxManipulator.for(120).price_incl_tax
  end

  def test_that_it_computes_the_price_excl_tax_correctly
    assert_equal 120.0, TaxManipulator.for(120).price_excl_tax
  end
end
