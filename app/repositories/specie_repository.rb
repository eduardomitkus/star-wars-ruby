class SpecieRepository

  # @param model [Specie]
  # @attribute specie_model [Specie]
  def initialize(model)
    @specie_model = model
  end

  # Persiste Spcecies no database
  # @param data [Array]
  # @return [Boolean]
  def create(data)
    @specie_model.create(data)
  end

  # Persiste Spcecies no database
  # @return [Boolean]
  def has_registers?
    @specie_model.all.exists?
  end

end