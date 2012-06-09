module Obviews
  module View
    extend ActiveSupport::Concern
    
    included do
      
      # Force this method definition since it's not in a module...
      def assign(new_assigns)
        @_assigns = new_assigns #.tap{ |a| a.keys.each { |k| a[k] } }
        new_assigns.keys.each do |key|
          define_singleton_method(key) { @_assigns[key] }
        end
      end
      
    end
    
  end
end
