module Sweetness
  class Group
    attr_reader :key, :value, :count

    def initialize(key)
      @key = key
      @value = 0
      @count = 0
    end

    def add(value)
      @count += 1
      @value += value
    end

    def avg
      if @count > 0
        @value.to_f / @count
      else
        0
      end
    end
  end
end