module Obviews
  module Controller
    extend ActiveSupport::Concern
    
    module Exposure
      attr_writer :_exposed_methods
      def _exposed_methods
        @_exposed_methods ||= []
      end
      def expose *methods
        self._exposed_methods += methods
      end
    end
    
    module ClassMethods
      include Exposure
    end
    include Exposure
    
    
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
        @exposed_methods
      end
    end
    
    def view_assigns
      exposed_methods = (self.class._exposed_methods + _exposed_methods).map(&:to_sym)
      ExposedAssigns.new self, exposed_methods
    end
  end
end