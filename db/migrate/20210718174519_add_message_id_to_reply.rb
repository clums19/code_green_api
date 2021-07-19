class AddMessageIdToReply < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :message_id, :integer
  end
end
