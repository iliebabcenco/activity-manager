class FixDateTypeForScheduleDate < ActiveRecord::Migration[6.1]
  def change
    change_column :activities, :schedule_date, :datetime
  end
end
