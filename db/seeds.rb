# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

csv_file_path = Rails.root.join("db", "apprentice.csv")

CSV.foreach(csv_file_path, headers: true) do |row|
  Apprentice.create!(
    email: row["email"],
    password_digest: row["password_digest"],
    address: row["address"],
    education: row["education"],
    holland_code: row["holland_code"],
  )
end
