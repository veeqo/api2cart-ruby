require 'spec_helper'

describe Api2cart::Errors::DuplicatedRecordInDatabase do
  subject { raise described_class, error_message }
  let(:error_message) { "Duplicated record in database" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::DuplicatedRecordInDatabase, "Duplicated record in database"
  end
end
