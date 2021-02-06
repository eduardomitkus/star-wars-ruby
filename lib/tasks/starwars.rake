require_relative '../../app/controllers/task/starship_controller'
require_relative '../../app/controllers/task/specie_controller'

namespace :starwars do
    desc "Inserir registros da API Starwars no banco de dados"

    task :starships do
        puts StarshipController.create
    end

    task :species do
        puts SpecieController.create
    end
end