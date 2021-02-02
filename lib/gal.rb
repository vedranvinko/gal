# frozen_string_literal: true

require_relative "gal/version"

require 'dotenv'

Dotenv.load

class Gal
    attr_accessor :default

    def initialize
        @default = {
            api_dev_key: ENV['token'],
            api_user_name: ENV['name'],
            api_user_password: ENV['password'],
        }
    end
end
