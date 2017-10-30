class Issue < ApplicationRecord
    validates :title, presence: true
    validates :kind, presence: true
    validates :priority, presence: true
end
