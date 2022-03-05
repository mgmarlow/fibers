require 'open-uri'
require 'async'
require 'async/barrier'
require 'async/http/internet'
require 'benchmark'

POKEMON = %w[
  pikachu
  squirtle
  charmander
  bulbasaur
  eevee
  chikorita
  cyndaquil
  totodile
  treecko
  torchic
  mudkip
]

Benchmark.bm do |x|
  x.report('async-http') do
    Async do |task|
      internet = Async::HTTP::Internet.new

      POKEMON.each do |name|
        task.async do
          internet.get "https://pokeapi.co/api/v2/pokemon/#{name}"
        end
      end
    end
  end

  x.report('threads') do
    POKEMON.map do |name|
      Thread.new do
        URI.open "https://pokeapi.co/api/v2/pokemon/#{name}"
      end
    end
      .each(&:join)
  end
end
