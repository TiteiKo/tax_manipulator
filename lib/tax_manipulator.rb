require 'tax_manipulator/version'
require 'tax_manipulator/errors'
require 'tax_manipulator/configuration'

require 'tax_manipulator/rate'

require 'tax_manipulator/manipulators/base'
require 'tax_manipulator/manipulators/excluding_tax'
require 'tax_manipulator/manipulators/including_tax'

module TaxManipulator
  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end

  def self.for(price, scheme: nil, date: Date.today)
    scheme ||= config.default_scheme

    case scheme
    when :excl_tax
      Manipulator::ExcludingTax.new(price, date)
    when :incl_tax
      Manipulator::IncludingTax.new(price, date)
    else
      raise UnknownStrategyError
    end
  end

  def self.reset_config!
    @config = Configuration.new
  end
end
