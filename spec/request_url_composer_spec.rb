require 'spec_helper'

describe Api2cart::RequestUrlComposer do
  describe 'protocol' do
    specify do
      expects(subject).to eq('http')
    end
  end

  describe 'domain' do
    specify do
      expects(subject).to eq('api.api2cart.com')
    end
  end

  describe 'path' do
    it 'contains API version in the beginning' do
      expect(subject).to start_with('/v1.0')
    end

    it 'contains method name translating underscores to dots' do
      expect(subject).to start_with('/v1.0/product.list')
    end

    it 'contains indicator of JSON format' do
      expect(subject).to start_with('/v1.0/product.list.json')
    end
  end

  describe 'query string' do
    it 'contains API key' do
      expect(subject).to include('api_key=43ba7043badfa2cd31cfaf5dc601a884')
    end

    it 'contains store key' do
      expect(subject).to include('store_key=f73470c9225d0edef1ec8df67a08388e')
    end

    it 'translates method arguments to query params' do
      expects(subjec).to include('params=force_all&start=20&count=10')
    end
  end

  describe 'all together' do
    specify do
      should == 'http://api.api2cart.com/v1.0/order.list.json?api_key=43ba7043badfa2cd31cfaf5dc601a884&count=10&params=force_all&start=20&store_key=f73470c9225d0edef1ec8df67a08388e'
    end
  end
end
