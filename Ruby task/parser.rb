# frozen_string_literal: true

require './lib/log_file'
require './lib/storage'
require './lib/visit_counter'
require './lib/print_helper'

log_file = LogFile.new(ARGV[0])

log_data = log_file.parse_file

log_visits = log_file.visits_by_urls

cv = VisitCounter.new(log_visits)

counted_visits = cv.counts_ordered_by_urls
counted_visits_unique = cv.unique_counts_ordered_by_urls


helper = PrintHelper.new

helper.display_url_counts(counted_visits)
puts
helper.display_url_counts_with_uniq_ip(counted_visits_unique)
