require 'spec_helper'

describe Api2cart, '#host' do
  context 'when host is not configured' do
    it 'should be equal to default value' do
      expect(Api2cart.host).to eq 'api.api2cart.com'
    end
  end

  context 'when host is configured' do
    let!(:current_host) { Api2cart.host }

    before { Api2cart.configure{ |config| config.host = 'host.com' } }

    it 'should be equal to new host' do
      expect(Api2cart.host).to eq 'host.com'
    end

    after { Api2cart.configure{ |config| config.host = current_host } }
  end
end
