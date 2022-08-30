class RemoveExplainFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :explain, :text
  end
end
