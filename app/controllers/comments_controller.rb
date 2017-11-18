class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments?issue_id=:issue_id
  # GET /comments?issue_id=:issue_id.json
  def index
    @comments = Comment.all
    #@comments = Issue.comments.all
  end

  # GET /comments/1?issue_id=:issue_id
  # GET /comments/1?issue_id=:issue_id.json
  def show
    @comments = Comment.all
    #@comments = Issue.comments.all
  end

  # GET /comments/new?issue_id=:issue_id
  def new
    @comment = Comment.new
    @issue = Issue.find(params[:issue_id])
  end

  # GET /comments/1/edit?issue_id=:issue_id
  def edit
  end

  # POST /comments?issue_id=:issue_id
  # POST /comments?issue_id=:issue_id.json
  def create
    #@comment = Issue.comments.new(comment_params)

    @comment = Comment.new(comment_params)
    
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

  # PATCH/PUT /comments/1?issue_id=:issue_id
  # PATCH/PUT /comments/1?issue_id=:issue_id.json
  def update
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

  # DELETE /comments/1?issue_id=:issue_id
  # DELETE /comments/1?issue_id=:issue_id.json
  def destroy
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
