class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
    @issue = Issue.find(params[:issue_id])
  end

  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to  issue_path(@upload.issues_id), notice: 'Upload successfull.' }
        #format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

    #if @upload.save
      #redirect_to issue_path(@upload.issues_id), notice: "The resume #{@upload.name} has been uploaded."
    #else
      #render "new"
    #end

  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to uploads_path, notice:  "The resume #{@upload.name} has been deleted."
  end

  private
  def upload_params
    params.require(:upload).permit(:name, :attachment, :issues_id)
  end

end