class Degree < ApplicationRecord
  DEGREELEVELS = ["Ensino Fundamental", "Ensino Médio", "Ensino Superior"].freeze
  belongs_to :user
end
