require 'spec_helper'

describe Api2cart::Errors::ConnectionBridgeResponseError do
  subject { raise described_class, error_message }
  let(:error_message) { "Connection bridge response error" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::ConnectionBridgeResponseError, "Connection bridge response error"
  end
end
