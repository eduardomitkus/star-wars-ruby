require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class StarwarsTaskController < ApplicationController

  def self.create_starships
    if Starship.all.exists?
      return "As naves já foram salvas no database"
    end

    Starship.create(StarwarsService.getStarships)
    return "Naves salvas no database"
  end

  # Salva Species da API no database
  # @return [String]
  private
  def self.create_species
    SpecieRepository.new(Specie).create
    return "Species salvas no database"
  end

end