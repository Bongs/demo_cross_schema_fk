class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :state_id
      t.string :subdomain

      t.timestamps
    end

    add_foreign_key :companies, "public.states", column: :state_id
  end
end
