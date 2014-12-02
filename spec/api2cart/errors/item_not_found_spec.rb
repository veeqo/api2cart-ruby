require 'spec_helper'

describe Api2cart::Errors::ItemNotFound do
  subject { raise described_class, error_message }
  let(:error_message) { "Item not found" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::ItemNotFound, "Item not found"
  end
end
