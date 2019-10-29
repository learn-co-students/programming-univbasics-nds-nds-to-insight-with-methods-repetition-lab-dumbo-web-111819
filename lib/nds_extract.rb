$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  grand_total=0
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
  directors = []
  
  i=0 
  while directors.length < source.length
    directors.push(source[i][:name])
    i += 1
  end 
  directors
end


def total_gross(source)
  
  directors_arr = list_of_directors(source)
  hash = directors_totals(source)
  total=0
  arr_index=0
  while arr_index < directors_arr.length
    name= directors_arr[arr_index]
    total += hash[name]

    arr_index += 1
  end
  total


end
  
  
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total



