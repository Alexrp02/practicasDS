class CreateDormitorios < ActiveRecord::Migration[7.1]
  def change
    create_table :dormitorios do |t|
      t.string :descripcion
      t.references :casa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
