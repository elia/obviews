module Obviews
  class ExposedAssigns < Hash
    def initialize object, exposed_methods
      @exposed_methods = exposed_methods
      super() do |assigns, key|
        if @exposed_methods.include? key.to_sym
          assigns[key] = object.send(key)
        end
      end
    end
      
    def keys
      super + @exposed_methods
    end
    
    def inspect
      "#<#{self.class}: @exposed_methods: (#{@exposed_methods.inspect}), hash: #{super}>"
    end
  end
end
