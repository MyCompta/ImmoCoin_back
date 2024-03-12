class NewPropertyParams < ActiveRecord::Migration[7.1]
  def change
    change_table(:properties) do |t|
      t.boolean :furnished, :terrace, :garden, :caretaker, :lift, null:false, default: false
      t.integer :surface, :room, :floor, null: false, default: 0
    end
  end
end
