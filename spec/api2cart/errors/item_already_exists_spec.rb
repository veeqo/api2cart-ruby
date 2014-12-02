require 'spec_helper'

describe Api2cart::Errors::ItemAlreadyExists do
  subject { raise described_class, error_message }
  let(:error_message) { "Item already exists" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::ItemAlreadyExists, "Item already exists"
  end
end
