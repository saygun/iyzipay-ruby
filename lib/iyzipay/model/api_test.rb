module Iyzipay
  module Model
    class ApiTest < IyzipayResource
      def retrieve(options)
        HttpClient.get("#{options.base_url}/payment/test", get_plain_http_header)
      end
    end
  end
end
