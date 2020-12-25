class AddTagsToTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :tags, :text, array: true, default: []
  end
end
