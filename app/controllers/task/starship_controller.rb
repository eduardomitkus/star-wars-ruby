require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class StarshipController < ApplicationController

  def self.create
    starshipsResponse = StarwarsService.getStarships
    Starship.create(starshipsResponse)
  end

end