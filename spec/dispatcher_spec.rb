require 'helper'
require 'q/dispatcher'



module Q
  module FakeDispatcher
    extend Dispatcher
  end

  describe Dispatcher do
    it 'responds to require_pattern' do
      FakeDispatcher.should respond_to(:require_pattern)
    end
    it 'responds to constant_suffix' do
      FakeDispatcher.should respond_to(:constant_suffix)
    end
    it 'sets the require pattern variable' do
       FakeDispatcher.require_pattern "support/%s_adapter"
       FakeDispatcher.instance_variable_get(:@require_pattern).should == "support/%s_adapter"
    end
    it 'sets the constant suffix variable' do
      FakeDispatcher.constant_suffix "Adapter"
      FakeDispatcher.instance_variable_get(:@constant_suffix).should == "Adapter"
    end
    
    describe '#[]' do  
      it 'retrieves a constant for the specified adapter' do
        ->{ FakeAdapter }.should raise_error(NameError)
        FakeDispatcher[:fake].should be(FakeAdapter)
      end
       
      it 'raises AdapterNotFoundError when the specified adapter does not exist' do
        ->{ FakeDispatcher[:batman] }.should raise_error(Dispatcher::AdapterNotFoundError)
      end
    end
    
  end
end