require 'spec_helper'

describe Api2cart::Errors::TooManyPrefixes do
  subject { raise described_class, error_message }
  let(:error_message) { "Too many prefixes" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::TooManyPrefixes, "Too many prefixes"
  end
end
