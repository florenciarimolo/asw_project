class Comment < ApplicationRecord
    validates :comentari, presence: true
    belongs_to :issue
end
