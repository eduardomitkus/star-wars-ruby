require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class StarshipController < ApplicationController

  def self.create
    if Starship.all.exists?
      return "As naves já foram salvas no database"
    end

    starshipsResponse = StarwarsService.getStarships
    Starship.create(starshipsResponse)
    return "Naves salvas no database"
  end

end