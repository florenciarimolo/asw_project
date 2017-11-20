class IssuesVotesController < ApplicationController

  # GET /issues/new
  def new
    check_auth
    @issues_vote = IssuesVote.new
  end

  def create
    check_auth
    @issues_vote = IssuesVote.new(issues_votes_params)
    @users = User.find(params[:username])
    @issue = Issue.find(params[:issue_id])
  end

  # DELETE /issues_votes/
  def destroy
    check_auth
    @issues_vote.destroy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issues_votes_params
      params.
       # require(:issues_vote).
      permit(
        :username,
        :issue_id
      )
  end
end
