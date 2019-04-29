class Degree < ApplicationRecord
  DEGREELEVELS = ["Ensino Fundamental", "Ensino Médio", "Ensino Superior",
                  "Pós-graduação", "Mestrado", "Doutorado"].freeze
  belongs_to :user
end
