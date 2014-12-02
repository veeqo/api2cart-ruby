require 'spec_helper'

describe Api2cart::Errors::IncorrectShoppingCartId do
  subject { raise described_class, error_message }
  let(:error_message) { "Incorrect shopping cart id" }

  it 'should raise error with complete message' do
    expect{ subject }.to raise_error Api2cart::Errors::IncorrectShoppingCartId, "Incorrect shopping cart id"
  end
end
