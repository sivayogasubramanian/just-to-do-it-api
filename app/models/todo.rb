class Todo < ApplicationRecord
  has_many :subtodos, dependent: :delete_all
  belongs_to :user
  before_create :set_deleted

  validates :completed, inclusion: { in: [ true, false ] }

  private

  def set_deleted
    self.deleted = false;
  end
end
