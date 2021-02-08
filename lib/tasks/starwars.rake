require_relative '../../app/controllers/task/starwars_task_controller'

namespace :starwars do
    desc "Inserir registros da API Starwars no banco de dados"

    # salva todas os registros da entidade starships no database
    task :starships => :environment do
        puts StarwarsTaskController.create_starships
    end
    # salva todas os registros da entidade species no database
    task :species => :environment do
        puts StarwarsTaskController.create_species
    end
    # salva todas os registros da entidade planets no database
    task :planets => :environment do
        puts StarwarsTaskController.create_planets
    end
    # salva todas os registros da entidade people no database
    task :people => :environment do
        puts StarwarsTaskController.create_people
    end
end