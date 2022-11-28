class Task < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true

  validates :content, presence: true,
                      length: { minimum: 10 }
end
