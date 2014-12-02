require 'spec_helper'

describe Api2cart::Store do
  context 'when request is successful', vcr: { cassette_name: 'successful_request' } do
    let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
    let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

    it 'returns parsed JSON' do
      expect(Api2cart::Store.new(api_key, store_key).product_count).to eq({ 'products_count' => 76 })
    end
  end

  context 'when response contains an error', vcr: { cassette_name: 'erroneous_request' } do
    context 'specific case' do
      it 'raises an exception with correspondent message' do
        expect {
          Api2cart::Store.new('wrong', 'even more wrong').product_count
        }.to raise_error(Api2cart::Errors::IncorrectApiKey, 'Incorrect API Key')
      end
    end

    context 'general case' do
      let(:api2cart_store) { Api2cart::Store.new('wrong', 'even more wrong') }
      let(:error_class) { double }

      subject{ api2cart_store.product_count }

      before do
        allow_any_instance_of(Api2cart::Client).to receive(:return_code).and_return('9')
        allow_any_instance_of(Api2cart::Client).to receive(:error_message).and_return('Something went wrong')
        allow(Api2cart::ErrorClassRecognizer).to receive(:call).with('9').and_return(error_class)
      end

      it 'should call for ErrorClassRecognizer' do
        expect_any_instance_of(Kernel).to receive(:raise).with(error_class, 'Something went wrong')

        subject
      end
    end
  end
end
