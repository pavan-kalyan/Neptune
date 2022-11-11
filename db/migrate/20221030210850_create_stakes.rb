class CreateStakes < ActiveRecord::Migration[7.0]
  def change
    create_table :stakes do |t|
      t.string :company_name
      t.integer :u_id
      t.string :value
      t.integer :c_id

      t.timestamps
    end
  end
end
