class IssuesWatchesController < ApplicationController

  # GET /issues/new
  def new
    check_auth
    @issues_watch = IssuesWatch.new(issues_watches_params)
    @issue = Issue.find(params[:issue_id])
    @users = User.find(params[:username])
    @issues_watch.save
  end

  # DELETE /issues_votes/
  def destroy
    check_auth
    @issues_vote.destroy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issues_watches_params
      params.
      # require(:issues_vote).
      permit(
        :issue_id,
        :username
      )
  end
end
