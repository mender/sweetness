require 'csv'

module Sweetness
  class Csv
    def load_pollens(csv)
      PollenDictionary.clear
      read_csv(csv) do |row|
        PollenDictionary.add(row)
      end
    end

    def load_harvest(csv)
      harvest = Harvest.new
      read_csv(csv) do |row|
        harvest.add(row)
      end
      harvest
    end

    private

    def read_csv(csv, &block)
      CSV.foreach(csv, csv_options, &block)
    end

    def csv_options
      {
        :col_sep => ',', 
        :headers => true, 
        :header_converters => ->(h) { h.strip.to_sym }
      }
    end
  end
end