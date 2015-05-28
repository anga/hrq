module Hrq
  # The DB class. This class content all the matches information.
  class Db
    class << self
      def matches
        @matches ||= []
      end

      def clear
        @matches = []
      end
      # Add a regexp to the db
      def add_match(regexp, weight: 0, &block)
        (@matches ||= []) << Hrq::Match.new(regexp, weight: weight, &block)
      end

      # Get the most valued regexp
      def match?(string)
        raise 'Pending'
      end
    end
  end
end