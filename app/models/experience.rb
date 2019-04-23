class Experience < ApplicationRecord
  EXPERIENCELEVELS = ["1 ano ou menos", "até 3 anos", "até 5 anos", "mais de 5 anos"].freeze
  belongs_to :user
end
