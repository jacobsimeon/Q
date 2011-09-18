module Q
  module Dispatcher
    class AdapterNotFoundError < StandardError; end
    class AdapterNotSpecifiedError < StandardError; end
    
    def require_pattern pattern
      @require_pattern = pattern
    end
    def constant_suffix suffix
      @constant_suffix = suffix
    end
    def dispatchables
      @dispatchables ||= {}
    end
    private :dispatchables
        
    def [] key
      return dispatchables[key] unless dispatchables[key].nil?
      begin
        require(@require_pattern % key.to_s)
        dispatchables[key] = const_get "#{key.to_s.capitalize}#{@constant_suffix}"
      rescue LoadError
        m = "Unable to find #{key} adapter, make sure it is in your load path"
        raise AdapterNotFoundError, m
      end
    end   
    
  end
end