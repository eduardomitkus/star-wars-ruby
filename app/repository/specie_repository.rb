require_relative '../services/starwars_service'

class SpecieRepository

  # @param specieModel [Specie]
  # @attribute specieModel [Specie]
  def initialize(specieModel)
    @specieModel = specieModel
  end

  # Persiste Spcecies no database
  def create
    @specieModel.create(StarwarsService.getSpecies)
  end

end