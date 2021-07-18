class AddDefaultValueToTopic < ActiveRecord::Migration[6.1]
  def change
    change_column_default :table, :topic, 'general'
  end
end
