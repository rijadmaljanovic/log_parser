# frozen_string_literal: true

require './spec/spec_helper'
require './lib/storage'

describe 'Storage' do
  describe 'initialize' do
    context 'when given a url'
    it 'should temporary store the url' do
      log_visit = Storage.new(url: '/home', ip_address: '10.1.0.12')

      expect(log_visit.url).to eq('/home')
    end

    context 'when given a ip address'
    it 'should temporary store an ip_address' do
      log_visit = Storage.new(url: '/home', ip_address: '10.1.0.12')

      expect(log_visit.ip_address).to eq('10.1.0.12')
    end
  end
end
