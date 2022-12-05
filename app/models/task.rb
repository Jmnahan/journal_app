class Task < ApplicationRecord
  belongs_to :category
  
  validates :title, presence: true,
                    uniqueness: true

  validates :content, presence: true,
                      length: { minimum: 10 }

  validates :priority, presence: true  

  validate :priority_cannot_be_in_the_past, on: :create

  def priority_cannot_be_in_the_past
    errors.add(:priority, "date can't be in the past") if priority.present? && priority < Date.today
  end

  def self.get_priority_tasks_for_today
    Task.where(priority: Date.today.beginning_of_day..Date.today.end_of_day)
  end
end
