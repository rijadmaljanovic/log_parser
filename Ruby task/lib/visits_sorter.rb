# frozen_string_literal: true

require 'pry'

class VisitSorter
  def initialize(storage)
    @storage = storage
  end

  def sort_visits
    storage.set_total_visits(storage.get_total_visits.sort_by { |_key, value| -value }.to_h)
    storage.set_total_unique_visits(storage.get_total_unique_visits.sort_by { |_key, value| -value }.to_h)
    storage
  end

  private

  attr_reader :storage
end
