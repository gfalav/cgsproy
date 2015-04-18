class CreateVanos < ActiveRecord::Migration
  def change
    create_table :vanos do |t|
      t.string :nombre
      t.integer :proyecto_id
      t.integer :conductor_id
      t.integer :zona_id
      t.decimal :vano
      t.decimal :hconductor

      t.timestamps null: false
    end
  end
end
