require 'spec_helper'

describe Api2cart do
  describe '#host' do
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

  describe '#api_version' do
    context 'when API version is not configured' do
      it 'should be equal to default value' do
        expect(Api2cart.api_version).to eq '1.0'
      end
    end

    context 'when API version is configured' do
      let!(:current_api_version) { Api2cart.api_version }

      before { Api2cart.configure{ |config| config.api_version = '1.1' } }

      it 'should be equal to new api_version' do
        expect(Api2cart.api_version).to eq '1.1'
      end

      after { Api2cart.configure{ |config| config.api_version = current_api_version } }
    end
  end
end
