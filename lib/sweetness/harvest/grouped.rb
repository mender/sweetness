module Sweetness
  class Harvest::Grouped
    def initialize(harvest, agg_class)
      @harvest = harvest
      @agg_class = agg_class
    end

    def groups
      @groups ||= aggregator.groups
    end

    def min
      never_nil do
        groups.min_by { |group| group.value }
      end
    end

    def min_avg
      never_nil do
        groups.min_by { |group| group.avg }
      end
    end

    def max
      never_nil do
        groups.max_by { |group| group.value }
      end
    end

    def max_avg
      never_nil do
        groups.max_by { |group| group.avg }
      end
    end

    private

    def aggregator
      @aggregator ||= @agg_class.new(@harvest.items)
    end

    def empty_group
      aggregator.empty_group
    end

    def never_nil(&block)
      yield || empty_group
    end
  end
end