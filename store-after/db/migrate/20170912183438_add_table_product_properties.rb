class AddTableProductProperties < ActiveRecord::Migration
  def up
     create_table :product_properties do |t|
      t.string :data
      t.belongs_to :product_field
      t.belongs_to :product
      t.timestamps
    end
    add_index :product_properties, :product_field_id
    add_index :product_properties, :product_id
    remove_column :products, :properties, :text
  end

  def down
    add_column :products, :properties, :text
    drop_table :product_properties
  end
end
