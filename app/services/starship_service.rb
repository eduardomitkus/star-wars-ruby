class StarshipService

  # Salva starships que são pesquisadas na API e vincula seus respectivos pilotos
  # @param starships_data [Array]
  # @param starship_repository [StarshipRepository]
  # @param person_repository [PersonRepository]
  # @return [Void]
  def self.create(starships_data, starship_repository, person_repository)
    starships_data.each do |starship|
      starship_model = starship_repository.create(starship.except("pilots"))
      #Lista as urls de corresponde a cada person/pilot
      starship["pilots"].each do |pilot_url|
        data = StarwarsService.get_pilot(pilot_url)
        puts data
        #Vincula as persons criadas com suas repectivas starships
        if person_repository.find(data["name"]) == false
          person_model = person_repository.create(data)
          starship_repository.person_associate(starship_model, person_model)
        end
      end
    end

    return
  end

end