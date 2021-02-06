require_relative '../../app/controllers/task/starship_controller'
require_relative '../../app/controllers/task/specie_controller'

namespace :starwars do
    desc "Inserir registros da API Starwars no banco de dados"

    # salva todos os starships no database
    task :starships => :environment do
        puts StarshipController.create
    end
    # salva todas as species no database
    task :species => :environment do
        puts SpecieController.create
    end
end