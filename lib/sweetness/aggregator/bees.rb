module Sweetness
  class Aggregator::Bees < Aggregator::Base
    def groups
      agg_for(bees_daily_work).group_by do |work|
        bee_id, _ = work.key.split('_', 2)
        [bee_id.to_i, work.value]
      end
    end

    private

    def bees_daily_work
      agg_for(@items).group_by do |work|
        ["#{work.bee_id}_#{work.day}", work.sugar_mg]
      end
    end
  end
end