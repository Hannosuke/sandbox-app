class AddUserForignKeyToTasks < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tasks, :users
  end
end
