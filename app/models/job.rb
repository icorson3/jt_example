class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.level_of_interest_count
    group(:level_of_interest).count
  end

  def self.count_by_city
    group(:city).count
  end

  def self.which_sort_params(sort_params)
    if sort_params == "interest"
      order(level_of_interest: :desc)
    elsif sort_params == "location"
      order(:city)
    end
  end

  def self.find_city(location_params)
    where(city: params[:location])
  end
end
