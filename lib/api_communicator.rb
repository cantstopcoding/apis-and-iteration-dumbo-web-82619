require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  all_characters = response_hash["results"]

  each_character = all_characters.find do |character_hash| 
    character_hash["name"] == character_name
      # binding.pry
  end 
  films_of_character = each_character["films"]
  # binding.pry

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

get_character_movies_from_api('Luke Skywalker')

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts film
  end 
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)

  films_hashes = films.map do |url|
    response_string1 = RestClient.get(url)
    response_hash = JSON.parse(response_string1)
    # binding.pry
    end 
    
  final_titles = films_hashes.map do |each_film|
    each_film["title"]
  end 
# final_titles = ["The Empire Strikes Back",
#  "Revenge of the Sith",
#  "Return of the Jedi",
#  "A New Hope",
#  "The Force Awakens"]
  
  print_movies(final_titles)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
