require 'spec_helper'

describe Api2cart::Errors::StoreUrlUnreachable do
  subject { raise described_class, error_message }
  let(:error_message) { "Store URL is unreachable" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::StoreUrlUnreachable, "Store URL is unreachable"
  end
end
