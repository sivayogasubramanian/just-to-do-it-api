class TodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :deadline, :completed, :tags

  has_many :subtodos
end
