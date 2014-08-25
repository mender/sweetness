module Sweetness
  class UnitOfWork
    attr_reader :bee_id, :day, :pollen_id, :mg

    def initialize(bee_id, day, pollen_id, mg)
      @bee_id = bee_id
      @day = day
      @pollen_id = pollen_id
      @mg = mg
    end

    def bee
      @bee ||= Bee.new(bee_id)
    end

    def pollen
      @pollen ||= PollenDictionary.find(pollen_id)
    end

    def sugar_mg
      pollen.sugar_from_mg(mg)
    end
  end
end