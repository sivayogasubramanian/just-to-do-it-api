class SubtodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :completed, :todo_id
end
