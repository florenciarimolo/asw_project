class IssuesVotesController < ApplicationController

  # GET /issues/new
  def new
    check_auth
    @issues_vote = IssuesVote.new(issues_votes_params)
    @issue = Issue.find(params[:issue_id])
    @users = User.find(params[:username])
    @issues_vote.save
    redirect_to @issue
  end

  # DELETE /issues_votes/
  def destroy
    check_auth
    @issues_vote = IssuesVote.where(params[:issue_id], params[:username]).first
    @issues_vote.destroy
    @issue = Issue.find(params[:issue_id])
    redirect_to @issue
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issues_votes_params
      params.
      # require(:issues_vote).
      permit(
        :issue_id,
        :username
      )
  end
end
