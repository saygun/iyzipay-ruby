module Iyzipay
  module Model
    class Payment < IyzipayResource
      ATTRIBUTES_ORDER = %w{
        locale
        conversationId
        price
        paidPrice
        installment
        paymentChannel
        basketId
        paymentGroup
        paymentCard
        buyer
        shippingAddress
        billingAddress
        basketItems
        paymentSource
        connectorName
      }.freeze

      TYPE_CAST = {
          price: 'add_price',
          paidPrice: 'add_price',
          paymentCard: 'add_payment_card',
          buyer: 'add_buyer',
          shippingAddress: 'add_address',
          billingAddress: 'add_address',
          basketItems: 'add_basket_items'
      }.freeze

      def initialize(request = {}, options)
        super(request, ATTRIBUTES_ORDER, TYPE_CAST)
        HttpClient.post("#{options.base_url}/payment/iyzipos/auth/ecom", get_http_header(request_string), request.to_json)
      end
    end
  end
end
