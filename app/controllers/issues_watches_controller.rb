class IssuesWatchesController < ApplicationController

  # GET /issues/new
  def new
    check_auth
    @issues_watch = IssuesWatch.new(issues_watches_params)
    @issue = Issue.find(params[:issue_id])
    @users = User.find(params[:username])
    @issues_watch.save
    redirect_to @issue
  end

  # DELETE /issues_votes/
  def destroy
    check_auth
    @issues_watch = IssuesWatch.where(params[:issue_id], params[:username]).first
    @issues_watch.destroy
    @issue = Issue.find(params[:issue_id])
    redirect_to @issue
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
