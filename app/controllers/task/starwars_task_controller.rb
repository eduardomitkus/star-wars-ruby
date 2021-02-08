require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'
require_relative '../../services/starship_service'
require_relative '../../services/person_service'

class StarwarsTaskController < ApplicationController

  # @class [StarwarsTaskController] Gerencia rotinas do contexto dos comandos da Task starwars

  # Salva Starships da API no database
  # @return [String]
  def self.create_starships
    if Starship.all.exists?
      return "As naves já foram salvas no database"
    end

    StarshipService
      .new(StarshipRepository.new(Starship), PersonRepository.new(Person))
      .create(StarwarsService.get_starships)

    return "Naves salvas no database"
  end

  # Salva Species da API no database
  # @return [String]
  def self.create_species
    specie_repository = SpecieRepository.new(Specie)

    if specie_repository.has_registers?
      return "Species já foram salvas no database."
    end

    specie_repository.create(StarwarsService.get_species)
    return "Species salvas no database."
  end

  # Salva Planets da API no database
  # @return [String]
  def self.create_planets
    planet_repository = PlanetRepository.new(Planet)

    if planet_repository.has_registers?
      return "Planets já foram salvos no database."
    end

    planet_repository.create(StarwarsService.get_planets)
    return "Planets salvos no database!"
  end

  # Salva People da API no database
  # @return [String]
  def self.create_people
    PersonService
      .new(PersonRepository.new(Person), PlanetRepository.new(Planet), SpecieRepository.new(Specie))
      .create(StarwarsService.get_people)

    return "People salvos no database!"
  end

end