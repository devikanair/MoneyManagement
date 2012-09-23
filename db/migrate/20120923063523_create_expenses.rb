class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.string :comment
      t.float :amount

      t.timestamps
    end
  end
end
