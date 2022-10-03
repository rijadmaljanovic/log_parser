# frozen_string_literal: true

require './spec/spec_helper'
require './lib/log_file'

describe 'LogFile' do
  subject { LogFile.new("#{File.dirname(File.absolute_path(__FILE__))}/test_log.log") }

  describe 'initialize' do
    context 'when given a path'
    it 'should contain the .log path and have a empty visits array' do
      expect(subject.path).to end_with('.log')
      expect(subject.log_visits).to eq([])
    end
  end

  describe '#parse_file' do
    context 'when given a wrong path'
    it 'raises error' do
      expect(subject.parse_file).to eq('File doesn\'t exists')
    end
  end

  describe '#parse_file' do
    context 'given path of the log file'
    it 'should iterate over the log file and instantiate Storage' do
      subject.parse_file
      expect(subject.log_visits).to include(Storage)
      expect(subject.log_visits.size).to eq(4)
    end
  end

  describe '#visits_by_urls' do
    it 'should group visits by urls' do
      subject.parse_file
      expect(subject.visits_by_urls.size).to eq(2)
    end
  end
end
