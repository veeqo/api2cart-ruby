require 'spec_helper'

describe Api2cart::Errors::IncorrectParameters do
  subject { raise described_class, error_message }
  let(:error_message) { "Incorrect params for method" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::IncorrectParameters, "Incorrect params for method"
  end
end
