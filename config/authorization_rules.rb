authorization do  
  role :Admin do  
    has_permission_on [:categories, :questions, :users, :answers, :roles, :assignments], :to => [:index, :show, :new, :create, :edit, :update, :destroy]  
  end  
    
  role :guest do  
    has_permission_on :questions, :to => [:index, :show] 
    has_permission_on :categories, :to => [:index, :show]  
    has_permission_on :user_sessions, :to => [:new]
    has_permission_on :users, :to => [:new, :login ]  
      
  end  
  
  role :teacher do
    has_permission_on :answers, :to => [:index, :show, :edit, :update, :new, :create, :destroy]  
    has_permission_on :questions, :to => [:index, :show, :edit, :update,  :new, :create, :destroy]  
    has_permission_on :categories, :to => [:new, :create, :update, :edit]  
  end
  
  role :student do  
    has_permission_on :categories, :to => [:index, :show]
    has_permission_on :questions, :to => [:index, :show, :create]  
    has_permission_on :answers, :to => [:index, :show, :new, :create]  
    has_permission_on :users, :to => [:edit, :update, :index, :show]  
    has_permission_on :assignments, :to => [:index, :show, :edit, :update]
    has_permission_on :responses, :to => [:index, :show, :new, :create, :edit, :update]
    
  end  
  
end  