require 'spec_helper'

describe Api2cart::Errors::ApiKeyDisabled do
  subject { raise described_class, error_message }
  let(:error_message) { "Api key is disabled" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::ApiKeyDisabled, "Api key is disabled"
  end
end
