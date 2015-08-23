module TaxManipulator
  class Rate
    attr_accessor :rate, :starting, :ending

    def initialize(params)
      params.each { |key, value| send "#{key}=", value }
    end

    def match?(date)
      return true if starting.nil? && ending.nil?
      return date <= ending if starting.nil?
      return date >= starting if ending.nil?
      date <= ending && date >= starting
    end
  end
end
