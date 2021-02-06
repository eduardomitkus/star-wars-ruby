require_relative '../services/starwars_service'

class SpecieRepository

  def initialize(specie)
    @specie = specie
  end

  def create
    @specie.create(StarwarsService.getSpecies)
  end

end