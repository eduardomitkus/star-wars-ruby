class PlanetRepository

  # @param model [PLanet]
  # @attribute planet_model [Planet]

  def initialize(model)
    @planet_model = model
  end

  # Persiste Planets no database
  # @param data [Array]
  # @return [Planet]
  def create(data)
    @planet_model.create(data)
  end

end