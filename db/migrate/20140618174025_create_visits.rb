class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :count

      t.timestamps
    end
  end
end
