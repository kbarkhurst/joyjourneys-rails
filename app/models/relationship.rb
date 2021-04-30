class Relationship < ApplicationRecord
  belongs_to :joy, optional: true
  belongs_to :inspired, class_name: "Joy"
  belongs_to :parent, class_name: "Joy"
  # add_foreign_key :parent, :inspired
end
