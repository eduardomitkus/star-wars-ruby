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
  # @return [Hash] data
  def self.get_planets
    get_all_registers(
      PLANETS_URL,
      [:name, :climate, :diameter, :gravity, :orbital_period, :population, :terrain]
    )
  end

  # Realiza parse em Hash e retorna a lista de resultadps
  # @param [RestClient::Response]
  # @return [Array] data
  def self.parse_data(data)
    return JSON
      .parse(data)
  end

  # Realiza busca de todos as páginas da response da API Starwars
  # @param url_resource[String]
  # @param fields[Hash]
  # @return [Hash]
  def self.get_all_registers(url_resource, fields)
    data = []
    url = BASE_URL << url_resource

    loop do
      response = parse_data(RestClient.get(url, headers={}))
      data = data + response.with_indifferent_access[:results]
      url = response.with_indifferent_access[:next]

      if url == nil
        break
      end

    end

    data.map { |item| item.slice(*fields) }
  end

end