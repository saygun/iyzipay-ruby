module Iyzipay
  class IyzipayResource

    AUTHORIZATION_HEADER_NAME = 'Authorization'
    RANDOM_HEADER_NAME = 'x-iyzi-rnd';
    AUTHORIZATION_HEADER_STRING = 'IYZWS %s:%s'
    RANDOM_STRING_SIZE = 8
    RANDOM_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

    def get_http_header(request = nil, authorize_request = true)
      header = {:accept => 'application/json',
                :'content-type' => 'application/json'}

      if authorize_request
        random_header_value = self.random_string(RANDOM_STRING_SIZE)
        header[:'Authorization'] = "#{prepare_authorization_string(request, random_header_value)}"
        header[:'x-iyzi-rnd'] = "#{random_header_value}"
      end

      header
    end

    def get_plain_http_header
      get_http_header(nil, false)
    end

    def prepare_authorization_string(request, random_header_value)
      hash_digest = calculate_hash(request, random_header_value)
      self.format_header_string(@configuration.api_key, hash_digest)
    end

    def json_decode(response, raw_result)
      json_result = JSON::parse(raw_result)
      response.from_json(json_result)
    end

    def calculate_hash(request, random_header_value)
      Digest::SHA1.base64digest("#{@configuration.api_key}#{random_header_value}#{@configuration.secret_key}#{request.to_PKI_request_string}")
    end

    def self.format_header_string(*args)
      sprintf(AUTHORIZATION_HEADER_STRING, *args)
    end

    def self.random_string(string_length)
      random_string = ''
      string_length.times do |idx|
        random_string << RANDOM_CHARS.split('').sample
      end
      random_string
    end
  end
end
