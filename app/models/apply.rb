class Apply < ApplicationRecord
  belongs_to :geek
  belongs_to :job

  def mark_delete
    self.update(deleted: true )
  end
end
