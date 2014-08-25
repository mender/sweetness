module Sweetness
  class Sugar
    attr_reader :pollen

    def initialize(pollen)
      @pollen = pollen
    end

    def weight_for(mg)
      pollen.sugar_per_mg * mg
    end
  end
end