class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.references :author_id, null: false, foreign_key: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
