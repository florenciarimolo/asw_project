class IssuesController < ApplicationController
    before_action :set_issue, only: [:show, :edit, :update, :destroy]

    # GET /issues
    # GET /issues.json
    def index
        check_auth
        @issues = Issue.all
        @users = User.all
    end

    # GET /issues/1
    # GET /issues/1.json
    def show
        check_auth
        @users=User.all
    end

    # GET /issues/new
    def new
        check_auth
        @issue = Issue.new
    end

    # GET /issues/1/edit
    def edit
        check_auth
    end

    # POST /issues
    # POST /issues.json
    def create
        check_auth
        @issue = Issue.new(issue_params)
        @issue.status = "new"
        @issue.votes = 0

        respond_to do |format|
            if @issue.save
                format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
                format.json { render :show, status: :created, location: @issue }
                else
                format.html { render :new }
                format.json { render json: @issue.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /issues/1
    # PATCH/PUT /issues/1.json
    def update
        check_auth
        respond_to do |format|
            if @issue.update(issue_params)
                format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
                format.json { render :show, status: :ok, location: @issue }
                else
                format.html { render :edit }
                format.json { render json: @issue.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /issues/1
    # DELETE /issues/1.json
    def destroy
        check_auth
        @issue.destroy
        respond_to do |format|
            format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
        @issue = Issue.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
        params.require(:issue).permit(:title, :kind, :priority, :status, :votes, :assignee, :created, :updated, :description, :comments )
    end

    # GET /issues/1/edit
    def edit
        check_auth
    end
end
