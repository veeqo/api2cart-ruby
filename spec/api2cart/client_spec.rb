describe Api2cart::Client do
  let(:api2cart_client) { Api2cart::Client.new(request_url) }

  context 'when API version is default' do
    before { api2cart_client.make_request! }

    context 'when request is successful', vcr: { cassette_name: 'v1_0/successful_request' } do
      let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
      let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

      let(:request_url) { Api2cart::RequestUrlComposer.new(api_key, store_key, :product_count).compose_request_url }

      describe '#successful?' do
        subject { api2cart_client.successful? }

        it { is_expected.to be true }
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

    context 'when request is erroneous', vcr: { cassette_name: 'v1_0/erroneous_request' } do
      let(:request_url) { Api2cart::RequestUrlComposer.new('wrong', 'even more wrong', :product_count).compose_request_url }

      describe '#successful?' do
        subject { api2cart_client.successful? }

        it { is_expected.to be false }
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

  context 'when API version is configured' do
    let!(:current_api_version) { Api2cart.api_version }

    before do
      Api2cart.configure{ |config| config.api_version = '1.1' }
      api2cart_client.make_request!
    end

    after { Api2cart.configure{ |config| config.api_version = current_api_version } }

    context 'when request is successful', vcr: { cassette_name: 'v1_1/successful_request' } do
      let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
      let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }

      let(:request_url) { Api2cart::RequestUrlComposer.new(api_key, store_key, :product_count).compose_request_url }

      describe '#successful?' do
        subject { api2cart_client.successful? }

        it { is_expected.to be true }
      end

      describe '#error_message' do
        subject { api2cart_client.error_message }

        it { is_expected.to eq '' }
      end

      describe '#result' do
        subject { api2cart_client.result }

        it 'returns result as parsed JSON' do
          expect(subject).to eq({ "products_count" => 88 })
        end
      end
    end

    context 'when request is erroneous', vcr: { cassette_name: 'v1_1/erroneous_request' } do
      let(:request_url) { Api2cart::RequestUrlComposer.new('wrong', 'even more wrong', :product_count).compose_request_url }

      describe '#successful?' do
        subject { api2cart_client.successful? }

        it { is_expected.to be false }
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
end
