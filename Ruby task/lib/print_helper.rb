# frozen_string_literal: true

class PrintHelper
  def display_url_counts(hash)
    hash.each do |key, value|
     # puts hash.map { |k, v| "#{v} #{k}" }.join(", ")
      display_en(key, value)
    end
  end

  def display_url_counts_with_uniq_ip(hash)
    hash.each do |key, value|
      #puts "#{key}:#{value}"
      # puts hash.map { |k, v| "#{v} #{k}" }.join(", ")
      display_u_en(key, value)
    end
  end

  private

  def display_en(key, value)
    puts "#{key} #{value} visits\n"
  end

  def display_u_en(key, value)
    puts "#{key} #{value} unique visits\n"
  end
end
