require 'spec_helper'

describe Api2cart::Errors::TooManyRequests do
  subject { raise described_class, error_message }
  let(:error_message) { "Too many requests to the store" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::TooManyRequests, "Too many requests to the store"
  end
end
