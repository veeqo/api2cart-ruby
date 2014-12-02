require 'spec_helper'

describe Api2cart::Errors::IncorrectFtpAccess do
  subject { raise described_class, error_message }
  let(:error_message) { "Incorrect ftp access" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::IncorrectFtpAccess, "Incorrect ftp access"
  end
end
