class Experience < ApplicationRecord
  EXPERIENCELEVELS = ["menos de 1 ano", "1 ano", "2 anos", "3 anos", "4 anos",
                      "5 anos", "mais de 5 anos"].freeze
  belongs_to :user
end
