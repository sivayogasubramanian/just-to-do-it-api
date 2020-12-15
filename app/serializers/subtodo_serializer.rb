class SubtodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :completed, :todo_id
end
