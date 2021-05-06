# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "Patricia", first_name: "Patricia", last_name: "Barnes", journal_description:'Patricia, the site’s namesake, battled breast cancer for almost 9 years during which she developed “awe-inspiring” coping skills and, by her example, taught those around her to live each day to the fullest. She found purpose and took comfort in actively acknowledging life’s simple, daily pleasures, as she dealt with the challenges presented by her disease. This “record of joy” was an intimate way for her family to view her life, separate from her diesease, and to view the family’s lives through her eyes. Journal content was woven into Christmas letters, health updates and e-mails. Patricia talked about her journal writing at support groups and functions. She inspired others to keep records of their own joys, and her story reached many in the breast-cancer community. Her first journal entry reads, “This is a very special journal because it is a record of the many blessings the Lord has generously given me at all times and in all circumstances. Anyone has my permission to read this journal. It is an account of joy!”', email: "patricia@example.com", password: "password")
User.create!(username: "Kelly", first_name: "Kelly", last_name: "Barkhurst", journal_description:"Daughter of Patricia Barnes, the site's inspiration, I'm a mother, designer, wife and friend trying to live each day to the fullest.", email: "kelly@example.com", password: "password")
# User.create!(username: "Aaron", first_name: "Aaron", last_name: "Barkhurst", journal_description:"Husband", password: "password", email: "aaron@example.com")
require "csv"
csv_text = File.read(Rails.root.join("lib", "seeds", "patricia_joy_journey.csv"))
csv = CSV.parse(csv_text, :headers => false, :encoding => "utf-8")
csv.each do |row|
  t = Joy.new
  t.body = row[1]
  t.user_id = 1
  t.visibility = true
  t.created_at = row[0]
  t.updated_at = row[0]
  # t.created_at = Date.strptime(row[0], "%e-%b-%y")
  # t.updated_at = Date.strptime(row[0], "%e-%b-%y")
  t.save
  puts "#{t.body}, #{t.created_at} saved"
end
# csv_text = File.read(Rails.root.join("lib", "seeds", "patricia_joy_journey2.csv"))
# csv = CSV.parse(csv_text, :headers => true, :encoding => "utf-8")
# csv.each do |row|
#   t = Joy.new
#   t.body = row["body"]
#   t.user_id = 1
#   t.visibility = true
#   t.created_at = Date.strptime(row[0], "%e-%b-%y")
#   t.updated_at = Date.strptime(row[0], "%e-%b-%y")
#   t.save
#   puts "#{t.body}, #{t.created_at} saved"
# end

Joy.create!(user_id:2, body: "Ha ha ha. I remember this day. ;)", visibility: true, created_at:"2021-04-21 00:00:00", updated_at: "2021-04-21 00:00:00")
Relationship.create!(inspired_id:1814, parent_id:932)
Joy.create!(user_id:2, body: "Caleb's soft skin. He tries to give kisses by rubbing his face across my cheek each morning.", visibility: true, created_at:"2013-01-09 00:00:00", updated_at: "2013-01-09 00:00:00")
Joy.create!(user_id:2, body: "My 4-year old, 'Guess what Mamma...I know the name of the boat the Pilgrims were on..the Cauliflower!'", visibility: true, created_at:"2018-11-16 00:00:00", updated_at: "2018-11-16 00:00:00")
Joy.create!(user_id:2, body: "We went to the park last night and Abigail is fearless - throwing herself down the big kid slides", visibility: true, created_at:"2015-10-13 00:00:00", updated_at: "2015-10-13 00:00:00")
Joy.create!(user_id:2, body: "On July 8th, 2013 -- 9 years after my sweet mother's death -- I am shown this joy entry. It is so poignant because in reflection, my mother was so defined by her emotional and spiritual strength, but also her physical fragility. I love you and miss you, ma mere.", visibility: true, created_at:"2013-7-8 00:00:00", updated_at: "2013-7-8 00:00:00")
Relationship.create!(inspired_id:1818, parent_id:1809)
# Joy.create!(user_id:3, body: "All the support from friends and family for the new addition, Caleb Allyn Barkhurst, to mine and Kelly's life!", visibility: true, created_at:"2012-3-9 00:00:00", updated_at: "2012-3-9 00:00:00")
# Joy.create!(user_id:3, body: "Finally getting snow! ", visibility: true, created_at:"2012-1-2 00:00:00", updated_at: "2012-1-2 00:00:00")
# Relationship.create!(inspired_id:1820, parent_id:1533)
Joy.create!(user_id:2, body: "Winter snow storm", visibility: true, created_at:"2021-2-16 00:00:00", updated_at: "2021-2-16 00:00:00")
Relationship.create!(inspired_id:1821, parent_id:1533)