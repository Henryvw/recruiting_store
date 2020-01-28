class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :shopping_cart, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
