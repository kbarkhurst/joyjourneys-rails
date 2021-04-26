class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :inspiredby_id
      t.integer :inspirationfor_id

      t.timestamps
    end
  end
end
