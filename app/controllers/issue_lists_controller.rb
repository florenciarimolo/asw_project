class IssueListsController < ApplicationController
  before_action :set_issue_list, only: [:show, :edit, :update, :destroy]

  # GET /issue_lists
  # GET /issue_lists.json
  def index
    @issue_lists = IssueList.all
  end

  # GET /issue_lists/1
  # GET /issue_lists/1.json
  def show
  end

  # GET /issue_lists/new
  def new
    @issue_list = IssueList.new
  end

  # GET /issue_lists/1/edit
  def edit
  end

  # POST /issue_lists
  # POST /issue_lists.json
  def create
    @issue_list = IssueList.new(issue_list_params)

    respond_to do |format|
      if @issue_list.save
        format.html { redirect_to issues_path, notice: 'Issue list was successfully created.' }
        format.json { render :show, status: :created, location: @issue_list }
      else
        format.html { render :new }
        format.json { render json: @issue_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_lists/1
  # PATCH/PUT /issue_lists/1.json
  def update
    respond_to do |format|
      if @issue_list.update(issue_list_params)
        format.html { redirect_to @issue_list, notice: 'Issue list was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_list }
      else
        format.html { render :edit }
        format.json { render json: @issue_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_lists/1
  # DELETE /issue_lists/1.json
  def destroy
    @issue_list.destroy
    respond_to do |format|
      format.html { redirect_to issue_lists_url, notice: 'Issue list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_list
      @issue_list = IssueList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_list_params
      params.require(:issue_list).permit(:name)
    end
end
