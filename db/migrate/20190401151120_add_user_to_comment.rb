class AddUserToComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :commenter, :string
    add_reference :comments, :user, foreign_key: true
  end
end
