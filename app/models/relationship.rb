class Relationship < ApplicationRecord
  belongs_to :joy, optional: true
  belongs_to :inspiredby, class_name: "Joy"
  belongs_to :inspirationfor, class_name: "Joy"
  # add_foreign_key :inspirationfor, :inspiredby
end
