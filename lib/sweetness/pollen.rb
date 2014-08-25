module Sweetness
  class Pollen
    attr_reader :id, :name, :sugar_per_mg

    def initialize(id, name, sugar_per_mg)
      @id = id
      @name = name
      @sugar_per_mg = sugar_per_mg
    end

    def sugar_from_mg(mg)
      sugar.weight_for(mg)
    end

    private

    def sugar
      @sugar ||= Sugar.new(self)
    end
  end
end