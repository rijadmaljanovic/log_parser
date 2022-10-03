# frozen_string_literal: true

require './spec/spec_helper'
require './lib/visit_counter'
require './lib/log_file'

describe 'VisitCounter' do
  subject { LogFile.new("#{File.dirname(File.absolute_path(__FILE__))}/test_log.log") }

  describe '#counts_ordered_by_urls' do
    it 'should order by urls with counting the visits' do
      subject.parse_file
      expect(subject.counts_ordered_by_urls.size).to eq(2)
      expect(subject.counts_ordered_by_urls).to eq([['/target', 2], ['/home', 2]])
    end
  end

  describe '#unique_counts_ordered_by_urls' do
    it 'should order by urls with a uniq ip count of the visits' do
      subject.parse_file
      expect(subject.unique_counts_ordered_by_urls.size).to eq(2)
      expect(subject.unique_counts_ordered_by_urls).to eq([['/target', 2], ['/home', 1]])
    end
  end
end
