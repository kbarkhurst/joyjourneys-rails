# config/initializers/no_timestamping.rb
module ActiveRecord
  class Base

    def self.attributes_protected_by_default
      [] # ["created_at", "updated_at" ..other]
    end

  end
end