class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string:body
      t.string:importance
      t.integer:user_id

      t.timestamps
    end
  end
end
