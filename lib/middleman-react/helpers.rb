require 'middleman-react/renderer'

module Middleman
  module React
    # Helper method to render react components
    module Helpers
      # rubocop:disable Metrics/MethodLength
      def react_component(name, args = {}, options = {}, &block)
        content = Middleman::React::Renderer.render(self, name, args)
      end
    end
  end
end
