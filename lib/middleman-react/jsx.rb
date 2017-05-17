# encoding: UTF-8

require 'execjs'
require 'middleman-react/jsx/processor'
require 'middleman-react/jsx/template'
require 'middleman-react/jsx/jsx_transformer'
require 'middleman-react/jsx/babel_transformer'
require 'babel/transpiler'
require 'react/source'

module Middleman
  module React
    # Methods for invoking the JSXTransformer via ExecJS
    module JSX

      # mattr_accessor :transformer
      #
      # DEFAULT_TRANSFORMER = BabelTransformer
      # self.transformer_class = DEFAULT_TRANSFORMER

      # def self.context
      #   contents =
      #     # If execjs uses therubyracer, there is no 'global'. Make sure
      #     # we have it so JSX script can work properly.
      #     'var global = global || this;' +
      #     File.read(Babel::Transpiler.script_path)
      #   @context ||= ExecJS.compile(contents)
      # end

      def self.transform(code, opts = {})
        # context.call('babel.transform', code, opts)['code']
        # require 'pry'
        # binding.pry
        p 'c'
        p opts

        transformer ||= BabelTransformer.new opts
        transformer.transform(code)
      end
      # module_function :transform
    end
  end
end
