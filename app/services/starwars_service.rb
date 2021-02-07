require 'rest-client'
require 'json'

class StarwarsService

  # @class [StarwarsService] Gerencia requisições na API Star Wars

  BASE_URL = 'https://swapi.dev/api/'
  STARSHIPS_URL = 'starships/'
  SPECIES_URL = 'species/'
  PLANETS_URL = 'planets/'

  # Retorna todas as Starships da API
  # @return [Hash]
  def self.get_starships
    data = RestClient.get(BASE_URL << STARSHIPS_URL, headers={})
    return parse_data(data).map{|starship| starship.slice('name', 'model', 'manufacturer', 'max_atmosphering_speed', 'passengers')}
  end

  # Retorna todas as Starships da API
  # @return [Array] data
  def self.get_species
    data = RestClient.get(BASE_URL << SPECIES_URL, headers={})
    return parse_data(data).map{|specie| specie.slice('name', 'classification', 'designation', 'language')}
  end

  # Retorna todas os Planets da API
  # @return [Array] data
  def self.get_planets
    data = RestClient.get(BASE_URL << PLANETS_URL, headers={})
    return parse_data(data).map{|specie| specie.slice('name', 'climate', 'diameter', 'gravity', 'orbital_period', 'population', 'terrain')}
  end

  # Realiza parse em Hash e retorna a lista de resultadps
  # @param [RestClient::Response]
  # @return [Array] data
  def self.parse_data(data)
    return JSON
      .parse(data)
      .with_indifferent_access[:results]
  end

end