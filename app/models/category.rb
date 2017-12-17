class Category < ApplicationRecord
  validates_uniqueness_of :title

  has_many :jobs
end
