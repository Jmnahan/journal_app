class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  validates :name, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }
end
