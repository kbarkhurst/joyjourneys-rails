class Joy < ApplicationRecord
  belongs_to :user

  has_many :inspiredby_relationships, class_name: "Relationship", foreign_key: "inspirationfor_id"
  has_many :inspiredbys, through: :inspiredby_relationships, source: :inspiredby

  has_many :inspirationfor_relationships, class_name: "Relationship", foreign_key: "inspiredby_id"
  has_many :inspirationfors, through: :inspirationfor_relationships, source: :inspirationfor
  # has_many :relationships
  # has_many :inspirationfor_relationships, :class_name => "Relationship", :foreign_key => "inspiredby_id"

  # has_many :inspirationfors, :through => :inspirationfor_relationships, :source => :inspirationfor

  default_scope { order(created_at: :desc) }

  # def search(search)
  #   if search
  #     @joys = Joy.where("body ILIKE ?", "%" + search + "%")
  #     # @joys = Joy.find_by(body: search)
  #   else
  #     @joys = Joy.all
  #   end
  # end
end
