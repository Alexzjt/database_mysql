class ReaderUser < ActiveRecord::Base
    validates :name, uniqueness: true
    def redis_key(string)
      "user:#{self.name}:#{string}"
    end
end




