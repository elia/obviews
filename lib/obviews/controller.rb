require 'obviews/exposed_assigns'

module Obviews
  module Controller
    extend ActiveSupport::Concern

    module Exposure
      attr_writer :_exposed_methods
      def _exposed_methods
        @_exposed_methods ||= []
      end

      def _exposed_values
        @_exposed_values ||= {}
      end

      def expose *methods
        if methods.size == 1 and methods.first.is_a? Hash
          _exposed_values.merge!(methods.first)
        else
          self._exposed_methods += methods.flatten
        end
      end
    end

    module ClassMethods
      include Exposure
    end
    include Exposure

    def view_assigns
      exposed_methods = (self.class._exposed_methods + _exposed_methods).map(&:to_sym)
      exposed_values  = (self.class._exposed_values.merge(_exposed_values))
      exposed_assigns = ExposedAssigns.new self, exposed_methods
      exposed_assigns.merge! exposed_values
    end
  end
end
