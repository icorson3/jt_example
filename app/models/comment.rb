class Comment < ApplicationRecord
  belongs_to :job

  scope :newest_first, -> { order(:created_at).reverse_order }
end
