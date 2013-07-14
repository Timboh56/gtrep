ActionMailer::Base.smtp_settings = {  
  :address        => 'smtp.gmail.com',
  :port           => 587,
  :domain         => "localhost",
  :authentication => :plain,
  :user_name      => "timboh56@gmail.com",
  :password       => "Koreplayer67"
}

ActionMailer::Base.delivery_method = :smtp