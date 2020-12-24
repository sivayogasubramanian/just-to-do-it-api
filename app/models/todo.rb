class Todo < ApplicationRecord
  has_many :subtodos, dependent: :delete_all
  belongs_to :user

  validates :title, presence: true
  validates :completed, inclusion: { in: [ true, false ] }
  
end
