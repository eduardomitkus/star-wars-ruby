require "test_helper"
require_relative '../../app/services/starwars_service'
require_relative '../../app/repositories/starship_repository'
require_relative '../../app/repositories/person_repository'

class StarshipServiceTest < ActiveSupport::TestCase


  test "should register a starship from api associating with pilots" do
    starship_response = StarwarsService.get_starships.select { |starhip| starhip["pilots"].count > 0 }.sample

    starship_salved = StarshipService
          .new(StarshipRepository.new(Starship), PersonRepository.new(Person))
          .save_with_pilots(starship_response)

    name_expected = starship_response["name"]
    pilots_counted_expected = starship_response["pilots"].count

    name_saved = starship_salved.name
    pilots_counted_saved = starship_salved.person_starhips.count

    puts "O nome da Starship salva é #{name_saved}"
    puts "O número de pilotos vinculados é #{pilots_counted_saved}"

    assert_equal(name_expected, name_saved)
    assert_equal(pilots_counted_expected, pilots_counted_saved)
  end
end