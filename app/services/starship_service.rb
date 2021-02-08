class StarshipService

  # @param starship_repository [StarshipRepository]
  # @param person_repository [person_repository]
  def initialize(starship_repository, person_repository)
    @starship_repository = starship_repository
    @person_repository = person_repository
  end

  # Salva starships que são pesquisadas na API e vincula seus respectivos pilotos
  # @param starships_data [Array]
  # @return [nil]
  def create(starships_data)
    starships_data.each do |starship|
      save_with_pilots(starship)
    end
    nil
  end

  # @param starship [Array]
  # @return [nil]
  def save_with_pilots(starship)
    starship_created = @starship_repository.create(starship.except("pilots"))

    starship["pilots"].each do |pilot_url|
      data = StarwarsService.get_pilot(pilot_url)
      # puts data
      #Vincula as persons criadas com suas repectivas starships
      if @person_repository.find(data["name"]) == false
        person_model = @person_repository.create(data)
        @starship_repository.person_associate(starship_created, person_model)
      end
    end
    return starship_created
  end

end