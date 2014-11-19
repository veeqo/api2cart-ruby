require 'spec_helper'

describe Api2cart do
  context 'when request is successful', vcr: { cassette_name: 'successful_request' } do
    let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
    let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

    it 'returns parsed JSON' do
      expect(Api2cart::Store.new(api_key, store_key).product_count).to eq({ 'products_count' => 76 })
    end
  end

  context 'when response contains an error', vcr: { cassette_name: 'erroneous_request' } do
    it 'raises an exception with correspondent message' do
      expect {
        Api2cart::Store.new('wrong', 'even more wrong').product_count
      }.to raise_error('Incorrect API Key')
    end
  end
end
