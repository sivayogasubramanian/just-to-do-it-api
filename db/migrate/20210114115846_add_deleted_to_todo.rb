class AddDeletedToTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :deleted, :boolean
  end
end
