class Issue < ApplicationRecord
    validates :title, presence: true
    validates :kind, presence: true
    validates :priority, presence: true
    VALID_KINDS = %w( bug enhancement proposal task )
    validates_inclusion_of :kind, :in => VALID_KINDS
    VALID_PRIORITIES = %w( trivial minor major critical blocker )
    validates_inclusion_of :priority, :in => VALID_PRIORITIES
    belongs_to :issue_list
    has_many :comments, dependent: :destroy
    
    accepts_nested_attributes_for :comments
end
