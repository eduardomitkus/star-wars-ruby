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

  # Verifica se há Planet cadastrado no database
  # @return [Boolean]
  def has_registers?
    @planet_model.exists?
  end

end