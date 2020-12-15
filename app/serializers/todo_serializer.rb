class TodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :deadline, :completed, :user_id

  has_many :subtodos
end
