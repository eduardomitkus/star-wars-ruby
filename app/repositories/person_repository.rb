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

  # Busca registros por nome
  # @param name [String]
  # @return [Person]
  def find(name)
    @person_model.exists?(name: name)
  end

  # Cadastrar se o registro não existir
  # @param data [Array]
  # @return [Person]
  def create_or_find(data)
    person = @person_model.where(name: data["name"])
    
     if person.exists?
       return person.first
     end

    create(data.except("homeworld", "species"))
  end

end