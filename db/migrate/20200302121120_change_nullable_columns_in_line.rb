class ChangeNullableColumnsInLine < ActiveRecord::Migration[6.0]
  def change
    change_column :lines, :user_id, :bigint, null:true
    change_column :lines, :plan_id, :bigint, null:true
  end
end
