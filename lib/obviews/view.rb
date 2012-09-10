module Obviews
  module View
    extend ActiveSupport::Concern

    included do
      alias assign_without_obviews assign

      # Force this method definition since it's not in a module...
      def assign(new_assigns)
        keys = new_assigns.keys
        exception_keys = [:application_trace, :exception, :framework_trace, :full_trace, :request]
        return assign_without_obviews(new_assigns) if exception_keys.all? {|k| k.in? keys}

        @_assigns = new_assigns
        keys.each do |key|
          define_singleton_method(key) { @_assigns[key] }
        end
      end

    end

  end
end
