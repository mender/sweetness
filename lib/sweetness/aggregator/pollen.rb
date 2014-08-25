module Sweetness
  class Aggregator::Pollen < Aggregator::Base
    def groups
      agg_for(@items).group_by do |work|
        [work.pollen_id, work.mg]
      end
    end
  end
end
