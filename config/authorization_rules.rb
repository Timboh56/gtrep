authorization do  
  role :admin do  
    has_permission_on [:categories, :questions,:users, :answers], :to => [:index, :show, :new, :create, :edit, :update, :destroy]  
  end  
    
  role :guest do  
    has_permission_on :questions, :to => [:index, :show] 
    has_permission_on :categories, :to => [:index, :show]  
     
  end  
  
  role :teacher do
    has_permission_on :answers, :to => [:index, :show, :edit, :update, :new, :create, :destroy]  
    has_permission_on :questions, :to => [:index, :show, :edit, :update,  :new, :create, :destroy]  
    has_permission_on :categories, :to => [:new, :create, :update, :edit]  
  end
  
  role :student do  
    has_permission_on :questions, :to => [:index, :show, :create]  
    has_permission_on :answers, :to => [:new, :create]  
  end  
  
end  