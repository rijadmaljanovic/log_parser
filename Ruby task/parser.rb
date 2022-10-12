# frozen_string_literal: true

require './lib/log_file'
require './lib/storage'
require './lib/visits_sorter'
require './lib/print_helper'

log_parser = LogFile.new(ARGV[0], Storage.new)
log_data = log_parser.parse_file

visit_sorter = VisitSorter.new(log_data)
sorted_data = visit_sorter.sort_visits

print_helper = PrintHelper.new(sorted_data)
print_helper.display_visits
