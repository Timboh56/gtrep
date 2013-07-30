module ApplicationHelper
  
  def nav_bar
    links = { 
      "Question Groups" => "question_groups", 
      "My Categories" => "categories",
      "My Responses" => "responses",
      "Answer Bank" => "answers",
      "Question Bank" => "questions",
    }
    if current_user.top_role.id < 3
      links["Users"] = "users"
    end
          
    render "layouts/nav_bar", {
      :links => links
    }
    
  end
  
  def index_table(object, klass)
    
    # attributes you don't want displayed in index table
      @filter_attr = ['id','updated_at','created_at','password_salt','persistence_token','login_count','login_ip','last_request_at','crypted_password']
    render "layouts/index_table", {
      :object => object,
      :klass => klass,
      :fields => klass.column_names[1,klass.column_names.length]
    }
  end
  
  def nice_form_for(object, options = {})
    
    
  end
  
  def flash_and_form_errors(object = nil)
    render :partial => "layouts/object_errors", :locals => { :object => object }
  end
  
  # normalizeField will take a field as a string and return it without "_id". e.g. user_id becomes user
  def normalizeField(string)
    string.gsub /_id|_/, " "
  end

  # filterObject removes input fields (an array of strings to be matched) from object
  def filterObject(object, fields)
    regex = fields.join("|")
    object.delete_if { |key, value| key.to_s =~ /^#{regex}/ }
  end
  
  def findByField(id, field)
    field = field.split('_id')[0].singularize.classify
    if id
      begin
        obj = "#{field}".constantize.find(id)
          case field 
            when 'Question' 
              obj.text
            when 'Answer'
              obj.text
            when 'QuestionGroup'
             obj.name
            when 'User'
              obj.username
          end
      rescue
        "#{field} was deleted."
      end
    end
  end
  
end
