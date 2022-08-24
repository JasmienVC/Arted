class CreateArtworkTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artwork, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
