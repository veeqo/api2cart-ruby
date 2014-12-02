require 'spec_helper'

describe Api2cart::Errors::IncorrectApiRequest do
  subject { raise described_class, error_message }
  let(:error_message) { "Incorrect API request" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::IncorrectApiRequest, "Incorrect API request"
  end
end
