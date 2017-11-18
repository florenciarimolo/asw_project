class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    def self.from_omniauth(auth_hash)
        user = where(username: auth_hash.info.nickname).first_or_create
        user.update(
            image_url: auth_hash.info.image,
            full_name: auth_hash.info.name,
            secret: auth_hash.credentials.secret
        )
        user
    end
end

