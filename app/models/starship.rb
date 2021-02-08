class Starship < ApplicationRecord
  has_many :person_starhips
  has_many :person, through: :person_starhips
end
