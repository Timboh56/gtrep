authorization do
	role: admin do
		has_permission_on [:categories, :users, :questions, :answers], :to => [:index, :show, :new, :create, :edit, :update, :destroy]	
	end
  
  role: student do
    has_permission_on [:categories, :users, :questions], :to => [:index, :show, :new]
  
end