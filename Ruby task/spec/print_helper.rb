# frozen_string_literal: true

require './spec/spec_helper'
require './lib/print_helper'

describe 'PrintHelper' do
  subject { LogFile.new("#{File.dirname(File.absolute_path(__FILE__))}/test_log.log") }

  describe '#display_url_counts' do
    it 'should get list of hits for each url' do
      subject.parse_file
      expect(subject.display_url_counts).to eq("/target 2 visits \n/home 2 visits \n")
    end
  end

  describe '#display_url_counts_with_uniq_ip' do
    it 'should get list of uniq hits for each url' do
      subject.parse_file
      expect(subject.display_url_counts_with_uniq_ip).to eq("/target 2  unique views\n/home 1  unique views\n")
    end
  end
end
