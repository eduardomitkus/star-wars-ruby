require_relative '../services/starwars_service'

class SpecieRepository

  # @param specieModel [Specie]
  # @attribute specieModel [Specie]
  def initialize(model)
    @specie_model = model
  end

  # Persiste Spcecies no database
  # @return [Boolean]
  def create
    @specie_model.create(StarwarsService.getSpecies)
  end

  # Persiste Spcecies no database
  # @return [Boolean]
  def has_registers?
    @specie_model.all.exists?
  end

end