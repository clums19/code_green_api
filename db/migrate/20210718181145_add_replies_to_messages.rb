class AddRepliesToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :replies, :integer
  end
end
