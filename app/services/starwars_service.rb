require 'rest-client'
require 'json'

class StarwarsService

  # @class [StarwarsService] Gerencia requisições na API Star Wars

  BASE_URL = 'https://swapi.dev/api/'
  STARSHIPS_URL = 'starships/'
  SPECIES_URL = 'species'

  # Retorna todas as Starships da API
  # @return [Hash]
  def self.getStarships
    data = RestClient.get(BASE_URL << STARSHIPS_URL, headers={})
    return parseData(data).map{|starship| starship.slice('name', 'model', 'manufacturer', 'max_atmosphering_speed', 'passengers')}
  end

  # Retorna todas as Starships da API
  # @return [Array] data
  def self.getSpecies
    data = RestClient.get(BASE_URL << SPECIES_URL, headers={})
    return parseData(data).map{|specie| specie.slice('name', 'classification', 'designation', 'language')}
  end

  # Realiza parse em Hash e retorna a lista de resultadps
  # @param [RestClient::Response]
  # @return [Array] data
  def self.parseData(data)
    return JSON
      .parse(data)
      .with_indifferent_access[:results]
  end

end