module Collector
  include Enumerable

  def [] key
    collected_items[key] ||= fetch_item key
  end
  def keys
    @keys ||= fetch_keys
  end
  def each
    keys.each do |key|
      yield self[key]
    end    
  end
  private 
  def collected_items
    @collected_items ||= {}
  end
  
end