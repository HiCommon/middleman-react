# encoding: UTF-8

require 'middleman-core'
require 'middleman-react/jsx'
require 'middleman-react/jsx/template'
require 'middleman-react/cjsx/template'
require 'middleman-react/helpers'

module Middleman
  module React
    # Middleman extension entry point
    class Extension < Middleman::Extension
      option :harmony, false, 'The option of harmony'
      option :strip_types, false, 'The option of stripTypes'
      option :components, ['components.js'], 'List of files for precompiling'
      option :replay_console, true, 'Replay console for prerendered components'

      # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      def initialize(app, options_hash = {}, &block)
        super

        Middleman::React::JSX::Template.harmony = options[:harmony]
        Middleman::React::JSX::Template.strip_types = options[:strip_types]
        Middleman::React::CJSX::Template.harmony = options[:harmony]
        Middleman::React::CJSX::Template.strip_types = options[:strip_types]
        #
        # app.config.react.jsx_transformer_class ||= Middleman::React::JSX::DEFAULT_TRANSFORMER
        # Middleman::React::JSX.transformer_class = app.config.react.jsx_transformer_class
        # Middleman::React::JSX.transform_options = app.config.react.jsx_transform_options

        Middleman::React::Renderer.components = options[:components]
        Middleman::React::Renderer.replay_console = options[:replay_console]

        ::Tilt.register 'jsx', Middleman::React::JSX::Template
        ::Sprockets.register_engine 'jsx', Middleman::React::JSX::Template

        ::Tilt.register 'cjsx', Middleman::React::CJSX::Template
        ::Sprockets.register_engine 'cjsx', Middleman::React::CJSX::Template

        app.helpers Middleman::React::Helpers
      end
      # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

      def after_configuration
        @app.template_extensions cjsx: :js, jsx: :js
      end
    end
  end
end
