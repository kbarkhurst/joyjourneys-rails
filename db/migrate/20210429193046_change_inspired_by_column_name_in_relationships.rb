class ChangeInspiredByColumnNameInRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :relationships, :inspiredby_id, :inspired_id
  end
end
