require 'spec_helper'

describe Api2cart::Errors::StoreNotFound do
  subject { raise described_class, error_message }
  let(:error_message) { "Store not found" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::StoreNotFound, "Store not found"
  end
end
