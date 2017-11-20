class IssuesVote < ApplicationRecord
  validates :issue_id, presence: true
  validates :username, presence: true
end
