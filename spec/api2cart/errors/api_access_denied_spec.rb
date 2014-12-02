require 'spec_helper'

describe Api2cart::Errors::ApiAccessDenied do
  subject { raise described_class, error_message }
  let(:error_message) { "Api access denied" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::ApiAccessDenied, "Api access denied"
  end
end
