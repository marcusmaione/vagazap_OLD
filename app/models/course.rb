class Course < ApplicationRecord
  COURSECATEGORIES = ["Idiomas", "Informática", "Outros"].freeze
  belongs_to :user
end
