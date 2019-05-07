require 'spec_helper'

describe Api2cart::ErrorClassRecognizer, '.call' do
  subject{ described_class.call(error_code) }

  context 'when error code is known' do
    it 'should return correspondent error' do
      expect( described_class.call('1') ).to eq Api2cart::Errors::ServiceNotAvailable
      expect( described_class.call('2') ).to eq Api2cart::Errors::IncorrectApiKey
      expect( described_class.call('3') ).to eq Api2cart::Errors::MethodNameMissing
      expect( described_class.call('4') ).to eq Api2cart::Errors::StoreAccessDenied
      expect( described_class.call('5') ).to eq Api2cart::Errors::ApiAccessDenied
      expect( described_class.call('6') ).to eq Api2cart::Errors::ApiKeyDisabled
      expect( described_class.call('7') ).to eq Api2cart::Errors::StoreRequestLimitExceeded
      expect( described_class.call('8') ).to eq Api2cart::Errors::StoreAlreadyExists
      expect( described_class.call('9') ).to eq Api2cart::Errors::InternalServiceError
      expect( described_class.call('10') ).to eq Api2cart::Errors::OverallRequestLimitExceeded
      expect( described_class.call('100') ).to eq Api2cart::Errors::IncorrectApiRequest
      expect( described_class.call('101') ).to eq Api2cart::Errors::StoreNotFound
      expect( described_class.call('102') ).to eq Api2cart::Errors::IncorrectFtpAccess
      expect( described_class.call('103') ).to eq Api2cart::Errors::IncorrectFtpWritePermissions
      expect( described_class.call('104') ).to eq Api2cart::Errors::BridgeNotFound
      expect( described_class.call('105') ).to eq Api2cart::Errors::ConnectionBridgeResponseError
      expect( described_class.call('106') ).to eq Api2cart::Errors::StoreUrlUnreachable
      expect( described_class.call('107') ).to eq Api2cart::Errors::IncorrectShoppingCartId
      expect( described_class.call('108') ).to eq Api2cart::Errors::SearchParametersMissing
      expect( described_class.call('109') ).to eq Api2cart::Errors::IncorrectParameters
      expect( described_class.call('110') ).to eq Api2cart::Errors::UpdateParametersMissing
      expect( described_class.call('111') ).to eq Api2cart::Errors::UpdateItemIdMissing
      expect( described_class.call('112') ).to eq Api2cart::Errors::ItemNotFound
      expect( described_class.call('113') ).to eq Api2cart::Errors::ItemAlreadyExists
      expect( described_class.call('114') ).to eq Api2cart::Errors::RequiredParameterMissing
      expect( described_class.call('115') ).to eq Api2cart::Errors::TooManyPrefixes
      expect( described_class.call('116') ).to eq Api2cart::Errors::DuplicatedRecordInDatabase
    end
  end

  context 'when error code is unknown' do
    let(:error_code) { '100000' }

    it 'should return Api2cart::Errors::UnknownError' do
      should eq Api2cart::Errors::UnknownError
    end
  end
end
