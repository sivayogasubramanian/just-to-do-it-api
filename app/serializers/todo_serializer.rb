class TodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :deadline, :completed, :tags, :deleted

  has_many :subtodos
end
