require 'open-uri'
require 'json'

class RandomPokemon
  def do_move
    puts pokemon["name"] + " does " + pokemon["abilities"].first["ability"]["name"] + "!"
  end

  def pokemon
    @pokemon ||= begin
      id = rand(100)
      raw = URI.open("https://pokeapi.co/api/v2/pokemon/#{id}").read
      JSON.parse(raw)
    end
  end
end

class SyncOrganizer
  def initialize
    @pokemon = RandomPokemon.new
  end

  def call
    5.times.map do
      @pokemon.do_move
    end
  end
end

class UnsafeThreadOrganizer
  def initialize
    @pokemon = RandomPokemon.new
  end

  def call
    threads = 5.times.map do
      Thread.new do
        @pokemon.do_move
      end
    end

    threads.each(&:join)
  end
end

puts "SyncOrganizer:"
SyncOrganizer.new.call
puts "\n"
puts "UnsafeThreadOrganizer:"
UnsafeThreadOrganizer.new.call
