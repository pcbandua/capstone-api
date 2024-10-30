class CreateEmployers < ActiveRecord::Migration[7.1]
  def change
    create_table :employers do |t|
      t.string :email
      t.string :password_digest
      t.string :company_name
      t.string :company_logo
      t.string :description
      t.string :industry
      t.string :website

      t.timestamps
    end
  end
end
