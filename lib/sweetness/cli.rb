require 'sweetness'

module Sweetness
  class Cli
    def initialize(argv)
      @harvest_file = argv.pop    
      @pollen_file = argv.pop
      
      unless @pollen_file && @harvest_file
        abort(usage)
      end
    end

    def run
      csv = Csv.new
      csv.load_pollens(@pollen_file)
      harvest = csv.load_harvest(@harvest_file)

      # 1.
      sugar_harvest = Harvest::Grouped.new(harvest, Aggregator::Sugar)
      puts "Pollen which contributed the most sugar is: %d" % sugar_harvest.max.key
      puts '===='

      # 2.
      pollen_harvest = Harvest::Grouped.new(harvest, Aggregator::Pollen)
      puts "Most popular pollen is: %d" % pollen_harvest.max.key
      puts '===='

      # 3.
      daily_harvest = Harvest::Grouped.new(harvest, Aggregator::Daily)
      puts "Best day is: %s" % daily_harvest.max.key
      puts "Worst day is: %s" % daily_harvest.min.key
      puts "Table of days:"
      daily_harvest.groups.each do |group|
        puts "| %s | %.2fmg |" % [group.key, group.value]
      end
      puts '===='

      # 4.
      bees_harvest = Harvest::Grouped.new(harvest, Aggregator::Bees)
      puts "Best bee is: %d" % bees_harvest.max_avg.key
      puts "Worst bee is: %d" % bees_harvest.min_avg.key
      puts "Table of bees:"
      bees_harvest.groups.each do |group|
        puts "| %s | %.2fmg |" % [group.key, group.avg]
      end
      puts '===='
    end

    private

    def usage
      "Sweetness\nUsage: sweetness [pollen_file] [harvest_file]".freeze
    end
  end
end