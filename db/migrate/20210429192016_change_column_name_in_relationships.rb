class ChangeColumnNameInRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :relationships, :inspirationfor_id, :parent_id
  end
end
