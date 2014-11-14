require 'spec_helper'

describe Api2cart do
  context 'when response is OK' do
    it 'returns parsed JSON'
  end

  context 'when response contains an error' do
    it 'raises an exception'

    specify 'exception message equals to an error from server'
  end
end
