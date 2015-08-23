module TaxManipulator
  module Manipulator
    class ExcludingTax < Base
      def vat
        (rate * price).round(2)
      end

      def price_incl_tax
        (price + vat).round(2)
      end

      def price_excl_tax
        price.round(2)
      end
    end
  end
end
