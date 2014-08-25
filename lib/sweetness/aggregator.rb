module Sweetness
  class Aggregator
    def initialize(items)
      @items = items
    end

    def group_by(&block)
      @items.inject({}) do |groups, item|
        key, value = yield(item)
        groups[key] ||= Group.new(key)
        groups[key].add(value)
        groups
      end.values
    end
  end
end