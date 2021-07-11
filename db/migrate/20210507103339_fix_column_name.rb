class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :users_id, :author_id
  end
end
