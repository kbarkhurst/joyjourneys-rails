class CreateJoys < ActiveRecord::Migration[6.1]
  def change
    create_table :joys do |t|
      t.integer :user_id
      t.string :body
      t.boolean :visibility
      t.integer :parent_id

      t.timestamps
    end
  end
end
