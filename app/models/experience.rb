class Experience < ApplicationRecord
  EXPERIENCELEVELS = ["Junior", "Pleno", "Senior"].freeze
  belongs_to :user
end
