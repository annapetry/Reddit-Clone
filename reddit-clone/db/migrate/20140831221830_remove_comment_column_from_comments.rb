class RemoveCommentColumnFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment
    add_column :comments, :content, :text
  end
end
