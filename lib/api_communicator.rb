require 'rest-client'
require 'json'
require 'pry'


def web_urls(character_name)

response_string = RestClient.get('http://swapi.dev/api/people')

response_hash = JSON.parse(response_string)
  films_array = []
  response_hash["results"].each do |result|
    if result["name"].downcase == character_name
      films_array = result["films"].map do |film|
        film
      end
    end
    films_array
  end
  pp films_array
end

def get_json(films_array)
    films_array.map do |film_url|
      response = RestClient.get(film_url)
      json_info = JSON.parse(response)
    end
end

def get_character_movies_from_api(character_name)
  films_array = web_urls(character_name)
  titles = get_json(films_array)
  #make the web request
end

  # iterate over the response hash to find the collection of `films` for the given `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  films.each do |single_film| #films is a hash, single_fiml is an array
    puts "The movie name is #{single_film["title"]} and the director of this movie is #{single_film["director"]}."
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
