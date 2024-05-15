class CreateCasas < ActiveRecord::Migration[7.1]
  def change
    create_table :casas do |t|
      t.string :tipo_casa
      t.string :cocina
      t.string :banio
      t.string :sala_estar
      t.string :propietario

      t.timestamps
    end
  end
end
