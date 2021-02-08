class Person < ApplicationRecord
  has_many :person_starhips
  has_many :starships, through: :person_starhips
end
