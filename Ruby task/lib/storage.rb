# frozen_string_literal: true

require 'pry'

class Storage
  def initialize(url = [], ip = [], temporary_visits = [], helper = [], total_visits = Hash.new(0),
                 total_unique_visits = Hash.new(0))
    @url = url
    @ip = ip
    @temporary_visits = temporary_visits
    @helper = helper
    @total_visits = total_visits
    @total_unique_visits = total_unique_visits
  end

  def insert(url, ip, line)
    @url << url
    @ip << ip
    @helper << line
    @total_visits = @url.group_by(&:itself).transform_values(&:count)
  end

  def insert_unique(line)
    @temporary_visits << line.split(' ')[0]
    @total_unique_visits = @temporary_visits.tally
    @helper.clear
  end

  # getter methods
  def get_total_visits
    @total_visits
  end

  def get_total_unique_visits
    @total_unique_visits
  end

  def get_helper
    @helper
  end

  # setter methods
  def set_total_visits(total_visits)
    @total_visits = total_visits
  end

  def set_total_unique_visits(total_unique_visits)
    @total_unique_visits = total_unique_visits
  end
end
