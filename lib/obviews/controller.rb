require 'obviews/exposed_assigns'
require 'active_support/core_ext/array/extract_options'
require 'active_support/hash_with_indifferent_access'

module Obviews
  module Controller
    extend ActiveSupport::Concern

    module Exposure
      attr_writer :_exposed_methods

      def _exposed_methods
        @_exposed_methods ||= HashWithIndifferentAccess.new { [] }
      end

      def _exposed_values
        @_exposed_values ||= HashWithIndifferentAccess.new { [] }
      end

      def expose *methods
        if methods.size == 1 and methods.first.is_a? Hash
          method_value_hash = methods.first
          _exposed_values.merge!(method_value_hash)
        else
          options = methods.extract_options!
          actions = Array(options.fetch(:only, nil))

          actions.each do |action|
            self._exposed_methods[action] += methods.flatten
          end
        end
      end
    end

    module ClassMethods
      include Exposure
    end
    include Exposure

    def view_assigns
      exposed_methods = exposed_methods_for_current_action
      exposed_values  = (self.class._exposed_values.merge(_exposed_values))
      exposed_assigns = ExposedAssigns.new self, exposed_methods
      exposed_assigns.merge! exposed_values
    end

    def exposed_methods_for_current_action
      methods = self.class._exposed_methods[nil] +
                           _exposed_methods[nil] +
                self.class._exposed_methods[action_name] +
                           _exposed_methods[action_name]

      methods.map(&:to_sym)
    end
  end
end
