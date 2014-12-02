require 'spec_helper'

describe Api2cart::Errors::InternalServiceError do
  subject { raise described_class, error_message }
  let(:error_message) { "Something went wrong with Api2Cart service" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::InternalServiceError, "Something went wrong with Api2Cart service"
  end
end
