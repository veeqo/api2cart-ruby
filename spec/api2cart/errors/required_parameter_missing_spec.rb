require 'spec_helper'

describe Api2cart::Errors::RequiredParameterMissing do
  subject { raise described_class, error_message }
  let(:error_message) { "Required parameter is missing" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::RequiredParameterMissing, "Required parameter is missing"
  end
end
