require 'csv'

def parse_pollens(csv)
  Sweetness::PollenDictionary.clear
  CSV.parse(csv, :col_sep => ',') do |row|
    Sweetness::PollenDictionary.add({
      :id => row[0],
      :name => row[1],
      :sugar_per_mg => row[2]
    })
  end
end

def parse_harvest(csv)
  harvest = Sweetness::Harvest.new
  CSV.parse(csv, :col_sep => ',') do |row|
    harvest.add({
      :bee_id => row[0],
      :day => row[1],
      :pollen_id => row[2],
      :miligrams_harvested => row[3]
    })
  end
  harvest
end 