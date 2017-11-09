class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end

class << self
def from_omniauth(auth_hash)
    user = find_or_create_by(username: auth_hash['info']['nickname'])
    user.fullname = auth_hash['info']['name']
    user.image_url = auth_hash['info']['image']
    user.save!
    user
end
end
