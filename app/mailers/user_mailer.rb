class UserMailer < ActionMailer::Base
  default from: "timboh56@gmail.com"
  
  def welcome_email(user)
    @user = user
    
    # generate salt
    @salt = (0..8).map{(65 + rand(24)).chr}.join()
    mail(to: @user.email, subject: "Welcome to GTREP")
  end
  
end
