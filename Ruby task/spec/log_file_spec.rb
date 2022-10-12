# frozen_string_literal: true

require './spec/spec_helper'
require './lib/log_file'

describe 'LogFile' do
  subject { LogFile.new("#{File.dirname(File.absolute_path(__FILE__))}/test_log.log", Storage.new) }

  describe 'initialize' do
    context 'when given a path'
    it 'should contain the .log path' do
      expect(subject.path).to end_with('.log')
    end
  end

  describe '#parse_file' do
    context 'when given a wrong path'
    it 'raises error' do
      expect(subject.parse_file).to raise_error(Errors::StandardError)
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
end
