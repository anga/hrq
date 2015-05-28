module Hrq
  class Match
    def initialize(regexp, weight: 0, &block)
      raise Hrq::RegexpExpected.new "Regexp expected but found #{regexp.class}" if not regexp.kind_of? Regexp
      @regexp = regexp
      @w = weight
      raise Hrq::BlockRequired.new 'Missing code for query match' if not block_given?
      @block = block
    end

    # Return the weight of the match or false if the given string match or not this query
    def match?(string)
      raise Hrq::StringExpected.new "String expected but found #{string.class}" if string.kind_of? String
      (@regexp.match string).kind_of? MatchData ? @w : false
    end
  end
end