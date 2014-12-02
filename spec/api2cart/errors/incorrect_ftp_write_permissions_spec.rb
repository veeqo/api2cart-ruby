require 'spec_helper'

describe Api2cart::Errors::IncorrectFtpWritePermissions do
  subject { raise described_class, error_message }
  let(:error_message) { "Incorrect ftp write permissions" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::IncorrectFtpWritePermissions, "Incorrect ftp write permissions"
  end
end
