require 'spec_helper'

describe Api2cart::Errors::IncorrectApiKey do
  subject { raise described_class, error_message }
  let(:error_message) { "Incorrect api key" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::IncorrectApiKey, "Incorrect api key"
  end
end
