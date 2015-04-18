class CreateCalcconds < ActiveRecord::Migration
  def change
    create_table :calcconds do |t|
      t.integer :vano_id
      t.integer :condclima_id
      t.decimal :temp
      t.decimal :viento
      t.decimal :hielo
      t.decimal :tension
      t.decimal :tiro
      t.decimal :flecha_t
      t.decimal :flecha_v
      t.decimal :flecha_h

      t.timestamps null: false
    end
  end
end
