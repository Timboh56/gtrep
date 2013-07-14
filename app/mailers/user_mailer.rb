class UserMailer < ActionMailer::Base
  default from: "timboh56@gmail.com"
  
  def welcome_email(user)
    @user = user
    
    # generate salt
    mail(to: @user.email, subject: "Welcome to GTREP")
  end
  
end
