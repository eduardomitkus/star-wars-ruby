require 'rest-client'
require 'json'

class StarwarsService

  def self.getStarships
    data = RestClient.get('https://swapi.dev/api/starships/', headers={})
    return JSON.parse(data).with_indifferent_access[:results]
  end


end