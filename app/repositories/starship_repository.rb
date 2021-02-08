class StarshipRepository

  # @param model [Starship]
  # @attribute planet_model [Starship]
  def initialize(model)
      @starship_model = model
  end

  # Persiste Starships no database
  # @param data [Hash]
  # @return [Starship]
  def create(data)
    @starship_model.create(data)
  end

  def person_associate(starship, person)
    starship.person << person
    starship.save
  end

end