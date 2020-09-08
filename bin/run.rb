#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
# show_character_movies(character)

films = get_character_movies_from_api(character)
# web_urls(character_name)
# pp get_json(films_array)
print_movies(films)