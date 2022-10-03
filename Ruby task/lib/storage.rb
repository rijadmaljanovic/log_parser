# frozen_string_literal: true

class Storage
  attr_reader :url, :ip_address

  def initialize(url:, ip_address:)
    @url = url
    @ip_address = ip_address
  end
end
