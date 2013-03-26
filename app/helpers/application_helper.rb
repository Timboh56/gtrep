module ApplicationHelper
  def index_table(object) 
    render "layouts/index_table", :object => object
  end
  
end
