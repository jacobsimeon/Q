require 'helper'
require 'q/collector'

class FakeCollector
  include Collector
  def fetch_keys
    [:hello, :world]
  end
  def fetch_item key
    @items ||= Hash.new do |hash, k|
      hash[k] = "hello from key -> #{key.to_s}"
    end
    @items[key]
  end
end

class ItemProvider
  def self.next_item
    
  end  
end

describe Collector do
  before :each do
    @collector = FakeCollector.new
  end
  it 'includes enumerable' do
    @collector.class.included_modules.should include(Enumerable)
  end
  it 'defines :each' do
    @collector.should respond_to(:each)
  end
  it 'does not define <=>' do
    @collector.should_not respond_to(:<)
    @collector.should_not respond_to('=')
    @collector.should_not respond_to(:>)
  end  
  describe '#keys' do
    it 'calls :fetch_keys to retrieve a list of keys that correspond to collectible objects' do
      @collector.should_receive :fetch_keys
      @collector.keys
    end
    it 'caches the respond from :fetch_keys' do
      keys = @collector.keys
      keys.should be @collector.keys
    end
  end
  
  describe '#[]' do
    it 'calls #fetch_item to retreive an item' do
      @collector.should_receive(:fetch_item).with(:key)
      @collector[:key]
    end
    it 'caches the respond from #fetch_item' do
      item = @collector[:key]
      item.should be(@collector[:key])      
    end
  end
  
  describe '#each' do
    it 'fetches items for all the keys and yeilds them to the block' do
      @collector.keys.length.should > 0
      @collector.each do |item|
        item.should_not be_nil
      end
    end    
  end  
  
end