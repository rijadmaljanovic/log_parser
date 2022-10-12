# frozen_string_literal: true

require 'pry'

class LogFile
  def initialize(path, storage)
    @path = path
    @storage = storage
  end

  def parse_file
    file_exists?

    File.read(path).each_line do |line|
      url, ip = line.split
      ip_valid?(ip)
      storage.insert(url, ip, line)
    end
    storage.get_helper.uniq.each do |line|
      storage.insert_unique(line)
    end
    storage
  end

  private

  attr_reader :path, :storage

  def file_exists?
    raise StandardError, 'File does not exist' unless File.file?(path)
  end

  def ip_valid?(ip)
    raise StandardError, 'Wrong IP format' unless ip.match?(/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/)
  end
end
