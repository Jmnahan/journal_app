class Category < ApplicationRecord
  # has_many :tasks
  
  validates :name, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }
end
