module TaxManipulator
  module Manipulator
    class Base
      attr_reader :price, :date

      def initialize(price, date)
        @price, @date = price.to_f, date
      end

      def rate
        @rate ||= begin
          TaxManipulator.config.rates.find { |r| r.match?(date) }.rate / 100.0
        end
      end
    end
  end
end
