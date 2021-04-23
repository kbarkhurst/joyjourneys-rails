# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Patricia", email: "patricia@example.com", password: "password")
User.create(name: "Kelly", email: "kelly@example.com", password: "password")
require "csv"
csv_text = File.read(Rails.root.join("lib", "seeds", "patricias_joys.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  t = Joy.new
  t.body = row["body"]
  t.user_id = 1
  t.visibility = true
  t.created_at = row["date"]
  t.save
  puts "#{t.body}, saved"
end
