module ApplicationHelper
  def index_table(object, klass) 
    render "layouts/index_table", {
      :object => object,
      :klass => klass,
      :fields => klass.column_names[1,klass.column_names.length]
    }
  end
  
  # normalizeField will take a field as a string and return it without "_id". e.g. user_id becomes user
  def normalizeField(string)
    string.gsub /_id|_/, " "
  end
  
  # filterObject removes input fields (an array of strings to be matched) from object
  def filterObject(object, fields)
    regex = fields.join("|")
    object.delete_if { |key, value| key.to_s =~ /^#{regex}/m }
  end
  
  def username(id)
    User.find(id).username rescue "N/A"
  end
end
