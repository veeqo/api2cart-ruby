require 'spec_helper'

describe Api2cart::Errors::SearchParametersMissing do
  subject { raise described_class, error_message }
  let(:error_message) { "Search parameters are not specified" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::SearchParametersMissing, "Search parameters are not specified"
  end
end
