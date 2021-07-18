class ChangeColumnFromNameToAuthor < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :name, :author
  end
end
