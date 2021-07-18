class RemoveAuthorFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :author
  end
end
