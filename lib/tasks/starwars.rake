require_relative '../../app/controllers/task/starwars_task_controller'

namespace :starwars do
    desc "Inserir registros da API Starwars no banco de dados"

    # salva todos os starships no database
    task :starships => :environment do
        puts StarwarsTaskController.create_starships
    end
    # salva todas as species no database
    task :species => :environment do
        puts StarwarsTaskController.create_species
    end

    task :planets => :environment do
        puts StarwarsTaskController.create_planets
    end
end