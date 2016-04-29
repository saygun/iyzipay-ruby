# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'test'
    @options.secret_key = 'test'
    @options.base_url = 'http://localhost:8080'
  end

  it 'should create payment' do
    payment_card = {card_token: 'TggW8eg3fDucmCxSkPqAloBsoVA=', card_user_key: 'hd5F9J+IE6BxZCoT9rctolTE9EI='}
    buyer =
        {
            id: 'BY789',
            name: 'John',
            surname: 'Doe',
            identity_number: '1000001',
            email: 'john@doe.com',
            registration_address: 'Tomtom Mah. Nur-i Ziya Sok. 16/1 34433 Beyoğlu',
            city: 'Istanbul',
            country: 'Turkey',
            ip: '32.43.23.43'
        }

    address =
        {
            address: 'Tomtom Mah. Nur-i Ziya Sok. 16/1 34433 Beyoğlu',
            contact_name: 'John Doe',
            city: 'Istanbul',
            country: 'Turkey'
        }

    item =
        {
            id: 'PARASUT:1',
            name: 'Test Subscription',
            category1: 'Finance',
            category2: 'Online',
            item_type: 'VIRTUAL',
            price: '1'
        }
    params =
        {
            locale: 'tr',
            conversation_id: '123456',
            price: 1,
            paid_price: 1,
            basket_id: 'TEST_BASKET_ID',
            payment_group: 'SUBSCRIPTION',
            payment_card: payment_card,
            buyer: buyer,
            billing_address: address,
            basket_items: [item]
        }
    payment = Iyzipay::Model::Payment.new(params, @options)
    begin
      $stderr.puts payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end
