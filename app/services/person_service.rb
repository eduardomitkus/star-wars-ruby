class PersonService

  # Persiste Peoples no database
  # @param person_repository [PersonRepository]
  # @param planet_repository [PLanetRepository]
  # @param specie_repository [SpecieRepository]
  def initialize(person_repository, planet_repository, specie_repository)
    @person_repository = person_repository
    @planet_repository = planet_repository
    @specie_repository = specie_repository
  end

  # Persiste Peoples no database
  # @param data [Array]
  # @return [Person]
  def create(data)
    data.each do |response|
      puts person = @person_repository.create_or_find(response)
      homeworld_response = StarwarsService.get_response(response["homeworld"])
      planet = @planet_repository.find(homeworld_response["name"]).first
      person.planet_id = planet.id

      if response["species"].empty? == false
        species_response = StarwarsService.get_response(response["species"].first)
        specie = @specie_repository.find(species_response["name"]).first
        person.specie_id = specie.id
      end
      person.save
    end
  end

end