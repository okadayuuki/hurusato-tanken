class CreateEria < ActiveRecord::Migration[5.2]
  def change
    create_table :eria do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :eria_id

      t.timestamps
    end
  end
end
