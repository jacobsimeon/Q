require 'helper'
require 'q/binary_string'

describe BinaryString do
  describe 'create' do 
    it 'creates a binary string from an existing string' do
      b = BinaryString.create "from a string"
      b.encoding.should == Encoding::ASCII_8BIT
    end
  end
end