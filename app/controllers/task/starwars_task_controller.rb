require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class StarwarsTaskController < ApplicationController

  # @class [StarwarsTaskController] Gerencia rotinas do contexto dos comandos da Task starwars

  # Salva Starships da API no database
  # @return [String]
  def self.create_starships
    starship_repository = StarshipRepository.new(Starship)

    # if Starship.all.exists?
    #   return "As naves já foram salvas no database"
    # end

    # starship_repository.create(StarwarsService.get_starships)

    StarwarsService.get_starships.each do |starship|
      starship_model = Starship.create(starship.except("pilots"))

      starship["pilots"].each do |pilot_url|
        data = StarwarsService.get_reponse(pilot_url).slice("name", "birth_year", "eye_color", "gender", "hair_color", "skin_color", "mass", "height")
        puts data
        if Person.exists?(name: data["name"]) == false
          person_model = Person.create(data)
          starship_model.person << person_model
          starship_model.save

        end

      end
    end

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

end