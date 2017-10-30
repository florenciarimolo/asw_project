class User < ApplicationRecord
    has_many :issues
    validates :full_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
