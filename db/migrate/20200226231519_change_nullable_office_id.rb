class ChangeNullableOfficeId < ActiveRecord::Migration[6.0]
  def change
    change_column :offices, :office_id, :bigint, null:true
  end
end
