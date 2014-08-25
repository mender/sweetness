module Sweetness
  class Aggregator::Base
    attr_reader :items

    def initialize(items)
      @items = items
    end

    def groups
      raise NotImplementedError
    end

    def empty_group
      Sweetness::Group.new(nil)
    end

    private

    def agg_for(items)
      Sweetness::Aggregator.new(items)
    end
  end
end