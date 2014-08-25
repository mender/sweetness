module Sweetness
  class Harvest
    attr_reader :items

    def initialize
      @items = []
    end

    def add(work)
      @items << UnitOfWork.new(
        work[:bee_id].to_i,
        work[:day],
        work[:pollen_id].to_i,
        work[:miligrams_harvested].to_f
      )
    end
  end
end