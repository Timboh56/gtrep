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
  
  def findByField(id, field)
    field = field.split('_id')[0].singularize.classify
    if !id.nil?
      case field 
        when 'Question' 
          Question.find(id).text
        when 'Answer'
          Answer.find(id).text
        when 'QuestionGroup'
          QuestionGroup.find(id).name
        when 'User'
          User.find(id).username
      end
    end
  end
  
end
