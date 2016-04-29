module Iyzipay
  module Model
    class Address < PkiBuilder
      ATTRIBUTES_ORDER = %w{
        address
        zipCode
        contactName
        city
        country
      }.freeze

      def initialize(values = {})
        super(values, ATTRIBUTES_ORDER)
      end
    end
  end
end
