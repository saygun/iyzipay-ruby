# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'api key'
    @options.secret_key = 'secret key'
    @options.base_url = 'https://api.iyzipay.com'
  end

  it 'should test payment service' do
    api_test = Iyzipay::ApiTest.new

    response = api_test.retrieve(@options)
    begin
      $stderr.puts response.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end
