class RemoveColumnsFromJoys < ActiveRecord::Migration[6.1]
  def change
    remove_column :joys, :parent_id, :integer
    remove_column :joys, :inspired_ids, :string
  end
end
