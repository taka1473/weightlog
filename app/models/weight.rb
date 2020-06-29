class Weight < ApplicationRecord
  belongs_to :user
  
  validates :weight, presence: true, numericality: {greater_than: 0}
end
