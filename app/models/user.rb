class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  acts_as_authentic
  has_many :assignments
  has_many :roles, :through => :assignments
  
  def role_symbols
    roles = ['admin','teacher','student']
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
