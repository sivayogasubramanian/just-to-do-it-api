class Todo < ApplicationRecord
  has_many :subtodos
  belongs_to :user
end
