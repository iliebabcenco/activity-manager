class ChangeAmountColumnNameAndType < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :amount, :description
    change_column :activities, :description, :string
    add_column :activities, :schedule_date, :date
    add_reference :activities, :groups, column: :group_id, foreign_key: true
  end
end
