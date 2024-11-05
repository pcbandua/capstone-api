class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.integer :apprentice_id
      t.integer :apprenticeship_id
      t.string :status

      t.timestamps
    end
  end
end
