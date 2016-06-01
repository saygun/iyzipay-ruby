# iyzipay-ruby

[![Build Status](https://travis-ci.org/iyzico/iyzipay-ruby.svg?branch=master)](https://travis-ci.org/iyzico/iyzipay-ruby)

You can sign up for an iyzico account at https://iyzico.com

# Requirements

* Ruby 1.9.3 or newer
* rest-client

# Installation

    gem install iyzipay

## Bundler

``` ruby
source 'https://rubygems.org'

gem 'rails'
gem 'iyzipay'

```

# Usage

```ruby

before :all do
  @options = Iyzipay::Options.new
  @options.api_key = 'your api key'
  @options.secret_key = 'your secret key'
  @options.base_url = 'https://sandbox-api.iyzipay.com'
end

it 'should create payment with physical and virtual item for listing or subscription' do
    payment_card = {
        cardHolderName: 'John Doe',
        cardNumber: '5528790000000008',
        expireYear: '2030',
        expireMonth: '12',
        cvc: '123',
        registerCard: 0
    }
    buyer = {
        id: 'BY789',
        name: 'John',
        surname: 'Doe',
        identityNumber: '74300864791',
        email: 'email@email.com',
        gsmNumber: '+905350000000',
        registrationDate: '2013-04-21 15:12:09',
        lastLoginDate: '2015-10-05 12:43:35',
        registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        city: 'Istanbul',
        country: 'Turkey',
        zipCode: '34732',
        ip: '85.34.78.112'
    }
    address = {
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        zipCode: '34732',
        contactName: 'John Doe',
        city: 'Istanbul',
        country: 'Turkey'
    }

    item1 = {
        id: 'BI101',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.3',
    }
    item2 = {
        id: 'BI102',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: Iyzipay::Model::BasketItemType::VIRTUAL,
        price: '0.5',
    }
    item3 = {
        id: 'BI103',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.2',
    }
    request = {
        locale: 'tr',
        conversationId: '123456789',
        price: '1.0',
        paidPrice: '1.1',
        installment: 1,
        paymentChannel: Iyzipay::Model::PaymentChannel::WEB,
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::SUBSCRIPTION,
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card,
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    payment = Iyzipay::Model::Payment.new.create(request, @options)
    begin
      $stderr.puts payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end
```
See other samples under iyzipay-ruby/spec module.

Testing
=======

You can run specs with RSpec under spec module.