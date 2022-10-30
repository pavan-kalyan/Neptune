class CreateStakes < ActiveRecord::Migration[7.0]
  def change
    create_table :stakes do |t|
      t.string :company_name
      t.string :user_name
      t.string :stake

      t.timestamps
    end
  end
end
