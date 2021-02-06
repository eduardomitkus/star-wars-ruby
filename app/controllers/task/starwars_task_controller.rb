require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class StarwarsTaskController < ApplicationController

  # @class [StarwarsTaskController] Gerencia rotinas do contexto dos comandos da Task starwars

  # Salva Starships da API no database
  # @return [String]
  def self.create_starships
    if Starship.all.exists?
      return "As naves já foram salvas no database"
    end

    Starship.create(StarwarsService.getStarships)
    return "Naves salvas no database"
  end

  # Salva Species da API no database
  # @return [String]
  def self.create_species
    specie_repository = SpecieRepository.new(Specie)

    if specie_repository.has_registers?
      return "Species já foram salvas no database"
    end

    specie_repository.create
    return "Species salvas no database"
  end

end