class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :role_ids
  acts_as_authentic
  has_many :responses, :dependent => :destroy
  has_many :question_groups, :dependent => :destroy
  has_many :assignments
  has_many :roles, :through => :assignments
  using_access_control
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
  
  def top_role
    
    # CHANGE SOON
    top = 3
    roles.map.collect{ |role|
      role.id < top ? top = role.id : nil
    }
    top
  end
end
