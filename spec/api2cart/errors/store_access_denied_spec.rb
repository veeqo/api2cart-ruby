require 'spec_helper'

describe Api2cart::Errors::StoreAccessDenied do
  subject { raise described_class, error_message }
  let(:error_message) { "Access to the store is denied" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::StoreAccessDenied, "Access to the store is denied"
  end
end
