# frozen_string_literal: true

module Lite
  module Encryption
    module Helpers
      module ClassMethods

        %i[decrypt encrypt].each do |name|
          define_method(name) do |value, opts = {}|
            klass = new
            klass.send(name, value, opts)
          end
        end

      end
    end
  end
end
