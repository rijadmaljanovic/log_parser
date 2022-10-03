# frozen_string_literal: true

class VisitCounter
  def initialize(log_visits)
    @log_visits = log_visits
  end

  def counts_ordered_by_urls
    @log_visits.map { |url, visits| [url, visits.count] }
               .sort { |a, b| b.last <=> a.last }
    #Hash[*@log_visits.flatten]
  end

  def unique_counts_ordered_by_urls
    @log_visits.map { |key, value| [key, value.map(&:ip_address).uniq.count] }
               .sort { |a, b| b.last <=> a.last }
    #Hash[*@log_visits.flatten]
  end
end
