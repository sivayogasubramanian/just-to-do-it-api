class Subtodo < ApplicationRecord
  belongs_to :todo

  validates :completed, inclusion: { in: [ true, false ] }
end
