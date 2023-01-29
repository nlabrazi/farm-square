class CreateProfils < ActiveRecord::Migration[6.1]
  def change
    create_table :profils do |t|
      t.string :name

      t.timestamps
    end
  end
end
