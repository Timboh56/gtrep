class UserMailer < ActionMailer::Base
  default from: "timboh56@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/activate?salt=" + user.salt.to_s
    
    # generate salt
    mail(to: @user.email, subject: "Welcome to GTREP")
  end
  
end