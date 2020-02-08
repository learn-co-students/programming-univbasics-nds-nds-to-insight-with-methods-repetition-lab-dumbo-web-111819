$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  dir_list = []
  dir_index = 0 
  while dir_index < source.length do 
    dir_list << source[dir_index][:name]
    dir_index += 1 
  end 
  dir_list
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  total = 0
  dir_income_hash = directors_totals(source)
  dir_names = list_of_directors(source)
  row_index = 0 
  while row_index < dir_names.length do 
    total += dir_income_hash[dir_names[row_index]]
    row_index += 1 
  end 
  total
end


