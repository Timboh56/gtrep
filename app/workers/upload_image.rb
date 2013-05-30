class UploadImage
  @queue = :upload_image
  
  def self.perform(upload)
      name = upload
	    directory = "public/data"
      
      # create the file path
      path = File.join(directory,name)
      
      # write the file
      begin
        File.open(path,"wb") { |f| f.write(upload.read) }
      rescue 
        puts "Error #{$!}"
      end
  end
end