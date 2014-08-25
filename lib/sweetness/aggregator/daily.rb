module Sweetness
  class Aggregator::Daily < Aggregator::Base
    def groups
      agg_for(@items).group_by do |work|
        [work.day, work.sugar_mg]
      end
    end
  end
end
