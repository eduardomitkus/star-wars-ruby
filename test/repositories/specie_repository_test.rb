require "test_helper"
require_relative '../../app/services/starwars_service'
require_relative '../../app/repositories/specie_repository'

class SpecieRepositoryTest < ActiveSupport::TestCase
  def setup
    @specie_repository = SpecieRepository.new(Specie)
    @specie_response = StarwarsService.get_species
  end

  test "should register a species from api" do
    specie_reponse = @specie_response.sample
    specie_name = specie_reponse['name']
    specie_name_saved = @specie_repository.create(specie_reponse).name

    puts specie_name_saved
    assert_equal(specie_name, specie_name_saved)
  end

end