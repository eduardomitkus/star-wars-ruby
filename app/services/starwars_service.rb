require 'rest-client'
require 'json'

class StarwarsService

  # @class [SpecieController] Gerencia rotinas do contexto de task das species

  BASE_URL = 'https://swapi.dev/api/'
  STARSHIPS_URL = 'starships/'

  # Retorna todas as Starships da API
  # @return [Hash]
  def self.getStarships
    data = RestClient.get(BASE_URL << STARSHIPS_URL, headers={})
    return JSON
             .parse(data)
             .with_indifferent_access[:results]
             .map{|starship| starship.slice('name', 'model', 'manufacturer', 'max_atmosphering_speed', 'passengers')}
  end

end