module Sweetness
  class PollenDictionary
    def self.items
      @items ||= {}
    end

    def self.clear
      items.clear
    end

    def self.add(pollen)
      items[pollen[:id].to_i] = Pollen.new(
        pollen[:id].to_i,
        pollen[:name],
        pollen[:sugar_per_mg].to_i
      )
    end

    def self.find(pollen_id)
      items[pollen_id] || default
    end

    def self.default
      @default ||= Pollen.new(nil, nil, 0)
    end
  end
end