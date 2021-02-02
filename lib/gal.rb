# frozen_string_literal: true

require_relative "gal/version"

require "dotenv"
require "rest-client"

Dotenv.load

class Gal
  attr_accessor :default

  def initialize
    @login = "https://pastebin.com/api/api_login.php"
    @url = "https://pastebin.com/api/api_post.php"
    @raw = "https://pastebin.com/api/api_raw.php"

    @default = {
      api_dev_key: ENV["token"],
      api_user_name: ENV["name"],
      api_user_password: ENV["password"],
      api_user_key: nil,
      api_option: nil,
      api_paste_key: nil,
      api_paste_name: nil,
      api_paste_code: nil,
      api_paste_format: "ruby",
      api_paste_private: "0",
      api_paste_expire_date: "N"
    }

    user_key
  end

  def show_options
    @default
  end

  # protected

  def user_key
    rsp = RestClient.post @login, @default
    @default[:api_user_key] = rsp.body
  end
end
