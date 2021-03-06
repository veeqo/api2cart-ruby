require 'spec_helper'

describe Api2cart::Errors::BridgeNotFound do
  subject { raise described_class, error_message }
  let(:error_message) { "Bridge not found" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::BridgeNotFound, "Bridge not found"
  end
end
