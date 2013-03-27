module ApplicationHelper
  def index_table(object, klass) 
    render "layouts/index_table", {
      :object => object, 
      :klass => klass,
      :fields => klass.column_names[1,klass.column_names.length]
    }
  end
  
  def uncapitalize(string)
    string[0, string.length].downcase
  end
end
