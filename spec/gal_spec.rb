# frozen_string_literal: true

RSpec.describe Gal do
  it "has a version number" do
    expect(Gal::VERSION).not_to be nil
  end

  it "loads token from .env" do
    # expect(Gal.new.default[:api_dev_key]).not_to be nil
  end

  it "loads username from .env" do
    # expect(Gal.new.default[:api_user_name]).not_to be nil
  end

  it "loads password from .env" do
    # expect(Gal.new.default[:api_user_password]).not_to be nil
  end

  it "gets the user key from API call" do
    # expect(Gal.new.default[:api_user_key]).not_to be nil
  end
end
