module TaxManipulator
  module Manipulator
    class IncludingTax < Base
      def vat
        (price - (price / (rate + 1))).round(2)
      end

      def price_incl_tax
        price.round(2)
      end

      def price_excl_tax
        (price - vat).round(2)
      end
    end
  end
end
