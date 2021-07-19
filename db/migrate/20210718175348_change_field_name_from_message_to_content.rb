class ChangeFieldNameFromMessageToContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :message, :content
  end
end
