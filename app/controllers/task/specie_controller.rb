require_relative '../../controllers/application_controller'
require_relative '../../services/starwars_service'

class SpecieController < ApplicationController

    # @class [SpecieController] Gerencia rotinas do contexto de task das species

    # Salva Species da API no database
    # @return [String]
    def self.create
        Specie.create(StarwarsService.getSpecies)
        return "Species salvas no database"
    end

end