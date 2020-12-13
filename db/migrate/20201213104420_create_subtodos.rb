class CreateSubtodos < ActiveRecord::Migration[6.1]
  def change
    create_table :subtodos do |t|
      t.string :title
      t.boolean :completed
      t.belongs_to :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
