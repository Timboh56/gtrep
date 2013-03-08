authorization do  
  role :admin do  
    has_permission_on [:categories, :responses, :questions, :users, :answers, :roles, :assignments], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :delete]  
  end  
    
  role :guest do  
    has_permission_on :questions, :to => [:index, :show] 
    has_permission_on :categories, :to => [:index, :show]  
    has_permission_on :user_sessions, :to => [:new, :create]
    has_permission_on :assignments, :to => [:new, :create]
    has_permission_on :users, :to => [:new, :create ]  
      
  end  
  
  role :teacher do
    has_permission_on :answers, :to => [:index, :show, :edit, :update, :new, :create, :destroy, :delete]  
    has_permission_on :questions, :to => [:index, :show, :edit, :update,  :new, :create, :destroy, :delete]  
    has_permission_on :categories, :to => [:new, :create, :update, :edit, :destroy, :delete]  
  end
  
  role :student do  
    has_permission_on :categories, :to => [:index, :show]
    has_permission_on :questions, :to => [:index, :show, :create]  
    has_permission_on :answers, :to => [:index, :show, :new, :create]  
    has_permission_on :users, :to => [:edit, :update, :index, :show]  
    has_permission_on :assignments, :to => [:index, :create, :show, :edit, :update]
    has_permission_on :responses, :to => [:index, :show, :new, :create, :edit, :update]
    
  end  
  
end  