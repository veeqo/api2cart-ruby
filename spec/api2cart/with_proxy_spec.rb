require 'spec_helper'

describe Api2cart do
  context 'when API version is default' do
    context 'when proxy URL is given', vcr: { cassette_name: 'v1_0/successful_request' } do
      let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
      let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

      let(:store_with_proxy) { Api2cart::Store.new api_key, store_key, proxy: 'http://anti-throttling-proxy.local:1080' }

      it 'sends request via proxy (see cassette)' do
        expect(store_with_proxy.product_count).to eq({ 'products_count' => 76 })
      end

      it 'extracts hostname and port from proxy URL' do
        expect(Net::HTTP).to receive(:new).with('api.api2cart.com', 443, 'anti-throttling-proxy.local', 1080).and_call_original
        store_with_proxy.product_count
      end
    end
  end

  context 'when API version is configured' do

    let!(:current_api_version) { Api2cart.api_version }

    before { Api2cart.configure{ |config| config.api_version = '1.1' } }
    after { Api2cart.configure{ |config| config.api_version = current_api_version } }

    context 'when proxy URL is given', vcr: { cassette_name: 'v1_1/successful_request' } do
      let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
      let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

      let(:store_with_proxy) { Api2cart::Store.new api_key, store_key, proxy: 'http://anti-throttling-proxy.local:1080' }

      it 'sends request via proxy (see cassette)' do
        expect(store_with_proxy.product_count).to eq({ 'products_count' => 88 })
      end

      it 'extracts hostname and port from proxy URL' do
        expect(Net::HTTP).to receive(:new).with('api.api2cart.com', 443, 'anti-throttling-proxy.local', 1080).and_call_original
        store_with_proxy.product_count
      end
    end
  end
end
