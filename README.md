# readme

Rotina de linha de comando Rails para salvar entidas da API Star Wars no database.


## Tecnologias

- Rails 6.1.1
- Postgres 12.2
- Ruby 3.0.0
- docker e docker-compose.

## requirements

- docker ^19.*
- docker-compose ^1.25.5.

## Gems específicas
- rest-client
- rexml - Os testes unitários não rodavam sem essa lib.

## Conectividade
- Container star-wars-ruby_web - Porta 3000
- star-wars-ruby_db_1 - Porta 5432

## Integrações
- Api Starwars (<https://swapi.dev/>)

## Patterns e conceitos utilizados
- Service - Para gerenciamento de requisiçoes de API e gerenciamento de repositories.
- Repository - Abstração para manipulação da interação com o database.
- Tasks - Rotina de linha de comando utilizado para ler api e salvar no database.

## Instruções
- A aplicação é utilizada via command-line através do Rake do próprio Rails
- Seguir sequência de comandos conforme instruções de boot da aplicação
- A Api Starwars apresentou time out em vários momentos.

## Iniciando a Aplicação
1. Criar o ambiente docker (`docker-compose up -d --build`)

2. Entrar no bash. ex: (`docker exec -it star-wars-ruby_web_1 bash`)

3. Criar o database da aplicação e o de teste (`rails db:create`)

4. Rodar migrações (`rails db:migrate`)

5. Rotina para criar Species no dabatase (`rake starwars:species`)

6. Rotina para criar Species no dabatase (`rake starwars:planets`)

7. Rotina para criar Starships e seus Pilots no dabatase (`rake starwars:starships`)

8. Rotina para criar People, suas Species e Planets e no dabatase (`rake starwars:people`)

9. Para rodar testes unitários (`rails test`)

## Enjoy
- Webserver - http://localhost:3000/
- Acesso ao bash do terminal para interação com comandos do Rake - 


### References

- **Documentação oficial Rails**. https://rubyonrails.org/
- **Documentação oficial ruby**. https://www.ruby-lang.org/pt/
