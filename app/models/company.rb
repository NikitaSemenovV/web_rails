class Company < ApplicationRecord
  has_many :jobs

  validates :name, presence: true
  validates :location, presence: true

  def mark_delete
    self.update(deleted: true )
  end
end
