require "test_helper"
require_relative '../../app/services/starwars_service'
require_relative '../../app/repositories/planet_repository'

class PlanetRepositoryTest < ActiveSupport::TestCase
  def setup
    @planet_repository = PlanetRepository.new(Planet)
    @planet_response = StarwarsService.get_planets
  end

  test "should register a planet from api" do
    planet_reponse = @planet_response.sample
    planet_name = planet_reponse['name']
    planet_name_saved = @planet_repository.create(planet_reponse).name

    puts "O nome do Planet salvo é #{planet_name_saved}"
    assert_equal(planet_name, planet_name_saved)

  end
end