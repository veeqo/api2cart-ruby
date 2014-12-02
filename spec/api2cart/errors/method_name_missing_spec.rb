require 'spec_helper'

describe Api2cart::Errors::MethodNameMissing do
  subject { raise described_class, error_message }
  let(:error_message) { "Method is not specified" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::MethodNameMissing, "Method is not specified"
  end
end
