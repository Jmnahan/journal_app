class Task < ApplicationRecord
  # belongs_to :category
  
  validates :title, presence: true,
                    uniqueness: true

  validates :content, presence: true,
                      length: { minimum: 10 }
end
