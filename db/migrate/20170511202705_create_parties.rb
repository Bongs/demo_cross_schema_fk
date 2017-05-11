class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :state_id

      t.timestamps
    end

    add_foreign_key :parties, "public.states", column: :state_id
  end
end
