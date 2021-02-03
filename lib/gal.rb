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

  def create(options)
    raise "Options must be a hash" unless options.is_a? Hash

    @default[:api_paste_name] = options[:api_paste_name] || "AutoPaste: #{Time.now.strftime("%d/%m/%Y %H:%M:%S")}"
    @default[:api_option] = "paste"
    @default[:api_paste_code] = options[:api_paste_code]

    rsp = RestClient.post @url, @default

    rsp.body
  end

  def delete(pkey)
    raise "Paste key must be a string" unless pkey.is_a? String

    @default[:api_option] = "delete"
    @default[:api_paste_key] = pkey

    rsp = RestClient.post @url, @default

    rsp.body
  end

  def user
    @default[:api_option] = "userdetails"

    rsp = RestClient.post @url, @default

    rsp.body
  end

  def list_user_entries(num)
    raise "Please provide integer as an argument" unless num.is_a? Integer

    @default[:api_results_limit] = num
    @default[:api_option] = "list"

    rsp = RestClient.post @url, @default

    rsp.body
  end

  alias pastes list_user_entries

  def show_options
    @default
  end

  def raw_paste(pkey)
    raise "Paste key must be a string" unless pkey.is_a? String

    @default[:api_paste_key] = pkey
    @default[:api_option] = "show_paste"

    rsp = RestClient.post @raw, @default

    rsp.body
  end

  protected

  def user_key
    rsp = RestClient.post @login, @default
    @default[:api_user_key] = rsp.body
  end
end
