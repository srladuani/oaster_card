class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.string :origin
      t.string :destination
      t.float :fare
      t.integer :via
      t.boolean :is_completed,default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
