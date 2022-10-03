# frozen_string_literal: true

require_relative 'storage'

class LogFile
  attr_reader :path, :log_visits

  def initialize(path)
    @path = path
    @log_visits = []
  end

  def parse_file
    file_exists

    File.read(path).each_line do |line|
      url, ip = line.split
      ip_match(ip)
      @log_visits << Storage.new(url: url, ip_address: ip)
    end
  end

  def visits_by_urls
    @visits_by_urls ||= log_visits.group_by(&:url)
  end

  private

  def file_exists
    unless File.file?(path)
      puts 'File doesn\'t exists'
      exit 1
    end
  end

  def ip_match(ip)
    return true if ip.match?(/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/)

    puts 'Insufficient permission, wrong IP format'
    exit 1
  end
end
