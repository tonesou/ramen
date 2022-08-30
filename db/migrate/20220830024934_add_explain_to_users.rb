class AddExplainToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :explain, :text
  end
end
