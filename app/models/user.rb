class User < ActiveRecord::Base
  attr_accessible :edit, :email, :new, :password, :username
end
