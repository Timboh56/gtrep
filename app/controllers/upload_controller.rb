class UploadController < ApplicationController
  def index
      render 'uploadfile.rhtml'
  end
  
  def uploadFile
    puts(params.to_s)
    Resque.enqueue(UploadImage,params[:uploadFile].original_filename)
    redirect_to '/upload', notice: 'Upload was a success.'
  end
end
