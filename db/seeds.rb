# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "Patricia", first_name: "Patricia", last_name: "Barnes", journal_description:'Patricia, the site’s namesake, battled breast cancer for almost 9 years during which she developed “awe-inspiring” coping skills and, by her example, taught those around her to live each day to the fullest. She found purpose and took comfort in actively acknowledging life’s simple, daily pleasures, as she dealt with the challenges presented by her disease. This “record of joy” was an intimate way for her family to view her life, separate from her diesease, and to view the family’s lives through her eyes. Journal content was woven into Christmas letters, health updates and e-mails. Patricia talked about her journal writing at support groups and functions. She inspired others to keep records of their own joys, and her story reached many in the breast-cancer community. Her first journal entry reads, “This is a very special journal because it is a record of the many blessings the Lord has generously given me at all times and in all circumstances. Anyone has my permission to read this journal. It is an account of joy!”', email: "patricia@example.com", password: "password")
User.create!(username: "Kelly", first_name: "Kelly", last_name: "Barkhurst", journal_description:"Daughter of Patricia Barnes, the site's inspiration, I'm a mother, designer, wife and friend trying to live each day to the fullest.", email: "kelly@example.com", password: "password")
require "csv"
csv_text = File.read(Rails.root.join("lib", "seeds", "patricia_joy_journey.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "utf-8")
csv.each do |row|
  t = Joy.new
  t.body = row["body"]
  t.user_id = 1
  t.visibility = true
  t.created_at = Date.strptime(row[0], "%e-%b-%y")
  t.updated_at = Date.strptime(row[0], "%e-%b-%y")
  t.save
  puts "#{t.body}, #{t.created_at} saved"
end
csv_text = File.read(Rails.root.join("lib", "seeds", "patricia_joy_journey2.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "utf-8")
csv.each do |row|
  t = Joy.new
  t.body = row["body"]
  t.user_id = 1
  t.visibility = true
  t.created_at = Date.strptime(row[0], "%e-%b-%y")
  t.updated_at = Date.strptime(row[0], "%e-%b-%y")
  t.save
  puts "#{t.body}, #{t.created_at} saved"
end




