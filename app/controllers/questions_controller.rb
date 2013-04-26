class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  filter_resource_access
  caches_action :index
  
  
  def index
    @questions = current_user.top_role == 1 ? Question.all : Question.open_questions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    
    get_vars
    
    respond_to do |format|
      format.html # new.html.erb
      if request.xhr?
        format.html {render :partial => "add_answers"}        
      else        
        format.json { render json: @question }
      end
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @categories = Category.all
  end

  # POST /questions
  # POST /questions.json
  def create
    
    expire_action :action => :index
    @question = Question.new(params[:question])
    get_vars
    
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }              
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    get_vars
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_vars
    @categories = Category.all
    @answers = Answer.all
  end
end
