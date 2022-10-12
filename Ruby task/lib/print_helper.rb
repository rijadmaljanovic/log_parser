# frozen_string_literal: true

require 'pry'

class PrintHelper
  def initialize(storage)
    @storage = storage
  end

  def display_visits
    is_empty?(storage.get_total_visits)
    display_en(storage.get_total_visits)

    is_empty?(storage.get_total_unique_visits)
    display_unique_en(storage.get_total_unique_visits)
  end

  private

  attr_reader :storage

  def is_empty?(visits)
    raise StandardError, 'Empty hash.' if visits.empty?
  end

  def display_en(visits)
    puts visits.map { |k, v| "#{k} #{v} visits" }.join("\n")
    puts
  end

  def display_unique_en(_visits)
    puts _visits.map { |k, v| "#{k} #{v} unique visits" }.join("\n")
    puts
  end
end
