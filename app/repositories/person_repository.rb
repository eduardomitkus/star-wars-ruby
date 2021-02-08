class PersonRepository

  # @param model [Person]
  # @attribute planet_model [Person]
  def initialize(model)
    @person_model = model
  end

  # Persiste Peoples no database
  # @param data [Array]
  # @return [Person]
  def create(data)
    @person_model.create(data)
  end

  def find(name)
    @person_model.exists?(name: name)
  end

end