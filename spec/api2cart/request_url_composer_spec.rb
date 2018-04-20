describe Api2cart::RequestUrlComposer do
  let(:api_key) { '43ba7043badfa2cd31cfaf5dc601a884' }
  let(:store_key) { '6f00bbf49f5ada8156506aba161408c6' }
  let(:method_name) { :order_list }
  let(:query_params) do
    {
      params: 'force_all',
      start: 20,
      count: 10
    }
  end
  let(:request_url_composer) { Api2cart::RequestUrlComposer.new(api_key, store_key, method_name, query_params) }

  let(:composed_url) { request_url_composer.compose_request_url }

  describe 'protocol' do
    subject { composed_url.scheme }

    specify do
      expect(subject).to eq('https')
    end
  end

  describe 'domain' do
    subject { composed_url.host }

    context 'when host is default' do
      specify do
        expect(subject).to eq('api.api2cart.com')
      end
    end

    context 'when host is configured' do
      let!(:current_host) { Api2cart.host }

      before { Api2cart.configure{ |config| config.host = 'host.com' } }

      specify do
        expect(subject).to eq('host.com')
      end

      after { Api2cart.configure{ |config| config.host = current_host } }
    end
  end

  describe 'path' do
    subject { composed_url.path }

    context 'when API version is default' do
      it 'contains API version in the beginning' do
        expect(subject).to start_with('/v1.0')
      end

      it 'contains method name translating underscores to dots' do
        expect(subject).to start_with('/v1.0/order.list')
      end

      it 'contains indicator of JSON format' do
        expect(subject).to start_with('/v1.0/order.list.json')
      end
    end

    context 'when API version is configured' do
      let!(:current_api_version) { Api2cart.api_version }

      before { Api2cart.configure{ |config| config.api_version = '1.1' } }

      it 'contains API version in the beginning' do
        expect(subject).to start_with('/v1.1')
      end

      it 'contains method name translating underscores to dots' do
        expect(subject).to start_with('/v1.1/order.list')
      end

      it 'contains indicator of JSON format' do
        expect(subject).to start_with('/v1.1/order.list.json')
      end

      after { Api2cart.configure{ |config| config.api_version = current_api_version } }
    end
  end

  describe 'query string' do
    subject { composed_url.query }

    it 'contains API key' do
      expect(subject).to include('api_key=43ba7043badfa2cd31cfaf5dc601a884')
    end

    it 'contains store key' do
      expect(subject).to include('store_key=6f00bbf49f5ada8156506aba161408c6')
    end

    it 'translates method arguments to query params' do
      expect(subject).to include('count=10&params=force_all&start=20')
    end
  end

  describe 'all together' do
    subject { composed_url.to_s }

    context 'when host is default' do
      it do
        is_expected.to eq 'https://api.api2cart.com/v1.0/order.list.json?api_key=43ba7043badfa2cd31cfaf5dc601a884&count=10&params=force_all&start=20&store_key=6f00bbf49f5ada8156506aba161408c6'
      end
    end

    context 'when host is configured' do
      let!(:current_host) { Api2cart.host }

      before { Api2cart.configure{ |config| config.host = 'host.com' } }

      it do
        is_expected.to eq 'https://host.com/v1.0/order.list.json?api_key=43ba7043badfa2cd31cfaf5dc601a884&count=10&params=force_all&start=20&store_key=6f00bbf49f5ada8156506aba161408c6'
      end

      after { Api2cart.configure{ |config| config.host = current_host } }
    end

    context 'when API version is configured' do
      let!(:current_api_version) { Api2cart.api_version }

      before { Api2cart.configure{ |config| config.api_version = '1.1' } }

      it do
        is_expected.to eq 'https://api.api2cart.com/v1.1/order.list.json?api_key=43ba7043badfa2cd31cfaf5dc601a884&count=10&params=force_all&start=20&store_key=6f00bbf49f5ada8156506aba161408c6'
      end

      after { Api2cart.configure{ |config| config.api_version = current_api_version } }
    end
  end

  context 'when there is no arguments' do
    subject { composed_url.to_s }

    let(:request_url_composer) { Api2cart::RequestUrlComposer.new(api_key, store_key, :product_count, nil) }

    it 'just does not add them to URL query' do
      is_expected.to eq 'https://api.api2cart.com/v1.0/product.count.json?api_key=43ba7043badfa2cd31cfaf5dc601a884&store_key=6f00bbf49f5ada8156506aba161408c6'
    end
  end
end
