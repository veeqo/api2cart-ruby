require 'spec_helper'

describe Api2cart::Errors::StoreRequestLimitExceeded do
  subject { raise described_class, error_message }
  let(:error_message) { 'You have exceeded the number of concurrent API requests per store' }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::StoreRequestLimitExceeded, 'You have exceeded the number of concurrent API requests per store'
  end

  it { expect(described_class.superclass).to eq(Api2cart::Errors::TooManyRequests) }
end
