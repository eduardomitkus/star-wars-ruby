require_relative '../../app/controllers/task/starship_controller'

namespace :starwars do
    desc "Inserir registros da API Starwars no banco de dados"

    task :starships => :environment do
        puts StarshipController.create
    end
end