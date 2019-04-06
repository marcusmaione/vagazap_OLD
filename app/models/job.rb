class Job < ApplicationRecord
  belongs_to :company
  has_many :favorites, :dependent => :destroy
end
