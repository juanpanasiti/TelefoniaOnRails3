class AddPublishableToInternal < ActiveRecord::Migration[6.0]
  def change
    add_column :internals, :publishable, :boolean
  end
end
