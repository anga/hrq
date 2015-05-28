require 'hrq/errors'
module Hrq
  class Context
    class << self
      # Load the template and evaluate the file adding fancy functions, like match.
      def load_template(path)
        content = File.read(path)
        context.instance_eval do
          eval content
        end
      end

      def evaluate(regexp, weight: 0, &block)
        context.match regexp, weight: weight, &block
      end

      def context
        @context ||= Hrq::Context.new
      end
    end
    # Add a new match to the db
    def match(regexp, weight: 0, &block)
      raise Hrq::RegexpExpected.new "Regexp expected but found #{regexp.class}" if not regexp.kind_of? Regexp
      Hrq::Db.add_match regexp, weight: weight, &block
    end
  end
end