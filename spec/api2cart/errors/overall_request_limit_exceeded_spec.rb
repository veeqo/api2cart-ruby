require 'spec_helper'

describe Api2cart::Errors::OverallRequestLimitExceeded do
  subject { raise described_class, error_message }
  let(:error_message) { 'You have exceeded the number of concurrent API requests per your API2Cart account' }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::OverallRequestLimitExceeded, 'You have exceeded the number of concurrent API requests per your API2Cart account'
  end

  it { expect(described_class.superclass).to eq(Api2cart::Errors::TooManyRequests) }
end
