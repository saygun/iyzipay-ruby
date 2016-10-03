#!/usr/bin/env ruby
# coding: utf-8

require 'json'
#require 'rest-client'
require 'base64'

module Iyzipay
  VERSION = "1.0.34"

  autoload :HttpClient,      "iyzipay/http_client"
  autoload :PkiBuilder,      "iyzipay/pki_builder"
  autoload :IyzipayResource, "iyzipay/iyzipay_resource"
  autoload :Model,           "iyzipay/model"
  autoload :Options,         "iyzipay/options"
  autoload :Version,         "iyzipay/version"

end

#require_relative 'iyzipay/http_client'
#require_relative 'iyzipay/pki_builder'
#require_relative 'iyzipay/iyzipay_resource'
#require_relative 'iyzipay/model'
#require_relative 'iyzipay/options'
#require_relative 'iyzipay/version'
