class Subtodo < ApplicationRecord
  belongs_to :todo

  validates :title, presence: true
  validates :completed, inclusion: { in: [ true, false ] }
end
