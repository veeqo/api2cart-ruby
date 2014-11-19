describe Api2cart::Client do
  let(:api2cart_client) { Api2cart::Client.new(request_url) }

  before { api2cart_client.make_request! }

  context 'when request is successful', vcr: { cassette_name: 'successful_request' } do
    let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
    let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

    let(:request_url) { Api2cart::RequestUrlComposer.new(api_key, store_key, :product_count).compose_request_url }

    describe '#successful?' do
      subject { api2cart_client.successful? }

      it { is_expected.to be_truthy }
    end

    describe '#error_message' do
      subject { api2cart_client.error_message }

      it { is_expected.to eq '' }
    end

    describe '#result' do
      subject { api2cart_client.result }

      it 'returns result as parsed JSON' do
        expect(subject).to eq({ "products_count" => 76 })
      end
    end
  end

  context 'when request is erroneous', vcr: { cassette_name: 'erroneous_request' } do
    let(:request_url) { Api2cart::RequestUrlComposer.new('wrong', 'even more wrong', :product_count).compose_request_url }

    describe '#successful?' do
      subject { api2cart_client.successful? }

      it { is_expected.to be_falsey }
    end

    describe '#error_message' do
      subject { api2cart_client.error_message }

      it 'parses request and extracts error message' do
        expect(subject).to eq 'Incorrect API Key'
      end
    end

    describe '#result' do
      subject { api2cart_client.result }

      it { is_expected.to eq({}) }
    end
  end
end
