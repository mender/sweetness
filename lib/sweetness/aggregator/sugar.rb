module Sweetness
  class Aggregator::Sugar < Aggregator::Base
    def groups
      agg_for(@items).group_by do |work|
        [work.pollen_id, work.sugar_mg]
      end
    end
  end
end