class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments?issue_id=:issue_id
  # GET /comments?issue_id=:issue_id.json
  def index
    check_auth
    @comments = Comment.all
    #@comments = Issue.comments.all
  end

  # GET /comments/:id?issue_id=:issue_id
  # GET /comments/:id?issue_id=:issue_id.json
  def show
    check_auth
    @comments = Comment.all
    #@comments = Issue.comments.all
  end

  # GET /comments/new?issue_id=:issue_id
  def new
    check_auth
    @comment = Comment.new
    @issue = Issue.find(params[:issue_id])
  end

  # GET /comments/:id/edit?issue_id=:issue_id
  def edit
  end

  # POST /comments?issue_id=:issue_id
  # POST /comments?issue_id=:issue_id.json
  def create
    check_auth
    @comment = Comment.new(comment_params)
    @comment.user = current_user.username
    respond_to do |format|
      if @comment.save
        format.html { redirect_to  issue_path(@comment.issue_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/:id?issue_id=:issue_id
  # PATCH/PUT /comments/:id?issue_id=:issue_id.json
  def update
    check_auth
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to issue_path(@comment.issue_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/:id?issue_id=:issue_id
  # DELETE /comments/:id?issue_id=:issue_id.json
  def destroy
    check_auth
    @pathissue = issue_path(@comment.issue_id)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @pathissue, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user, :comment, :issue_id)
    end
end
