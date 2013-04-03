class ResponsesController < ApplicationController
  filter_resource_access
  
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.where( user_id: current_user.id )
    @question_groups = Question_group.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
    @response = Response.new
    @questions = Question.all
    @answers = Answer.all
    @question_groups = QuestionGroup.all
    
    respond_to do |format|
      
      # detect for ajax get request, render all questions within 
      # the requested question_group and answers for all multiple choice questions
      if request.xhr?
        @question_group_questions = QuestionGroupQuestion.where(
          "question_group_id" => params[:question_group_id]
        ).collect { 
          |d| Question.find(d.question_id) 
        }
        @question_group_questions_answers = @question_group_questions.collect { 
          |d|  d.question_type == 0 ? [d.id, Answer.find_all_by_questions_id(d.id)] : nil
        }
        format.json { render json: { 
          :question_group_questions => @question_group_questions, 
          :answers => @question_group_questions_answers 
        }
      }
      else
        # respond to normal request
        format.html # new.html.erb
        format.json { render json: @response }
      end
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
    
    # replace soon with a search feature 
    @question_groups = QuestionGroup.all
    @questions = Question.all
    @answers = Answer.all
  end

  # POST /responses
  # POST /responses.json
  def create
    params[:response][:user_id] = current_user.id
    @response = Response.new(params[:response])

    respond_to do |format|
      puts('anything')
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end
end
