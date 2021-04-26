class AddColumnToJoysInspiredIds < ActiveRecord::Migration[6.1]
  def change
    add_column :joys, :inspired_ids, :string
  end
end
