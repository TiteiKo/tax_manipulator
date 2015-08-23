module TaxManipulator
  class Configuration
    attr_reader :rates, :default_scheme

    def initialize
      @rates = []
    end

    def add_rate(rate:, starting: nil, ending: nil)
      rates << Rate.new(rate: rate, starting: starting, ending: ending)
    end

    def default_scheme=(scheme)
      raise UnknownStrategyError unless scheme.nil? || [:excl_tax, :incl_tax].include?(scheme)

      @default_scheme = scheme
    end
  end
end
