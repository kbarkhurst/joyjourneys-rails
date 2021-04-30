class Joy < ApplicationRecord
  belongs_to :user
  has_many :relationships

  has_many :inspired_relationships, class_name: "Relationship", foreign_key: "parent_id"
  has_many :inspireds, through: :inspired_relationships, source: :inspired

  has_many :parent_relationships, class_name: "Relationship", foreign_key: "inspired_id"
  has_many :parents, through: :parent_relationships, source: :parent
 

  default_scope { order(created_at: :desc) }


end
