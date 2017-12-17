class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_by_interest
    select("name, AVG(level_of_interest) AS average_level_of_interest")
    .joins(:jobs)
    .group(:name)
    .limit(3)
  end
end
