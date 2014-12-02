require 'spec_helper'

describe Api2cart::Errors::UpdateItemIdMissing do
  subject { raise described_class, error_message }
  let(:error_message) { "Update item identifier not specified" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::UpdateItemIdMissing, "Update item identifier not specified"
  end
end
