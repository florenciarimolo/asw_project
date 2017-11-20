class IssuesVote < ApplicationRecord
    validates :username, presence: true
    validates :issues_id, presence: true
end
