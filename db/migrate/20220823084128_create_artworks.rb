class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.text :description
      t.float :price
      t.float :shipping_costs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
