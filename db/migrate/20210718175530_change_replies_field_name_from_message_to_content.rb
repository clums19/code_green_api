class ChangeRepliesFieldNameFromMessageToContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :replies, :message, :content
  end
end
