class CreateApprentices < ActiveRecord::Migration[7.1]
  def change
    create_table :apprentices do |t|
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :education
      t.string :holland_code

      t.timestamps
    end
  end
end
