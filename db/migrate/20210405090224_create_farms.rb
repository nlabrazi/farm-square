class CreateFarms < ActiveRecord::Migration[6.1]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :address
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
