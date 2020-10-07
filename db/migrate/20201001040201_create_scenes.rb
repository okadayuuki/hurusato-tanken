class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.integer :post_id
      t.integer :each_scene

      t.timestamps
    end
  end
end
