require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class StarwarsTaskController < ApplicationController

  def self.createStarships
    if Starship.all.exists?
      return "As naves já foram salvas no database"
    end

    starshipsResponse = StarwarsService.getStarships
    Starship.create(starshipsResponse)
    return "Naves salvas no database"
  end

  # Salva Species da API no database
  # @return [String]
  def self.createSpecies
    Specie.create(StarwarsService.getSpecies)
    return "Species salvas no database"
  end

end