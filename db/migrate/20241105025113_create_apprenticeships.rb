class CreateApprenticeships < ActiveRecord::Migration[7.1]
  def change
    create_table :apprenticeships do |t|
      t.integer :employer_id
      t.string :title
      t.string :summary
      t.string :location_status
      t.string :skills_required
      t.string :qualifications
      t.string :holland_code_preference
      t.string :compensation
      t.string :duration
      t.integer :positions_available
      t.string :national_registered_status

      t.timestamps
    end
  end
end
