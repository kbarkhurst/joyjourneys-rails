class Joy < ApplicationRecord
  belongs_to :user
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
