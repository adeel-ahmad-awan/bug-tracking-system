class Step < ApplicationRecord
  belongs_to :bug

  validates :body, presence: true
end
