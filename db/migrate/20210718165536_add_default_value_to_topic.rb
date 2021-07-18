class AddDefaultValueToTopic < ActiveRecord::Migration[6.1]
  def change
    change_column_default :messages, :topic, 'general'
  end
end
