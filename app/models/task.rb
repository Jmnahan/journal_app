class Task < ApplicationRecord
  belongs_to :category
  
  validates :title, presence: true,
                    uniqueness: true

  validates :content, presence: true,
                      length: { minimum: 10 }

  validates :priority, presence: true  

  # validate :priority_cannot_be_in_the_past, on: :create

  # def priority_cannot_be_in_the_past
  #   errors.add(:priority, "date can't be in the past") if priority.present? && priority < Date.today
  # end

  def self.get_priority_tasks_for_today
    all.order(priority: :asc).each_with_object({}) do |task, days|
      day = task.formatted_priority

      if days[day]
        days[day].push task
      else
        days[day] = [task]
      end
    end
  end

  def priority_today?
    (Time.now.beginning_of_day..Time.now.end_of_day).cover? priority
  end

  def formatted_priority
    return "No deadline" if priority.blank?
    return "Today" if priority_today?
  end

  def self.get_priority_tasks_for_today
    all.(Time.now.beginning_of_day..Time.now.end_of_day).cover? priority
  end

end
