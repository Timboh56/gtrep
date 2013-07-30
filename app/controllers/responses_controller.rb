class ResponsesController < ApplicationController
  filter_resource_access
  respond_to :html, :xml, :json
  
  
  # GET /responses
  # GET /responses.json
  def index
    
    # if the current user is a teacher or admin, display all responses submitted
    # otherwise current user is a student, and may only view his/her own responses
    @responses = current_user.top_role.id < 3 ? Response.all : Response.user_responses(current_user.id)

    @question_groups = QuestionGroup.all

    respond_with(@responses)
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_with(@response)
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
        
        # if the selected question group is empty (user selects no question group)
        if !params[:question_group_id].empty?
        
          # create question_group_questions instance object which stores
          # for each question in question group an array containing the question object
          # and the answers for that question if it is a multiple choice question.
          @question_group_questions = QuestionGroupQuestion.where(
            "question_group_id" => params[:question_group_id]
          ).collect { 
            |d| 
            question = Question.find(d.question_id)
            [ question, 
              question.question_type == 2 ? Answer.find_all_by_questions_id(d.question_id).to_a : nil
            ]
          }

          format.html { render :partial => "question_group_form", :layout => false, :locals => { 
            :question_group_questions => @question_group_questions, 
            }
          }
        else
          format.html { render :partial => "question_answer", :layout => false, :locals => { :f => @response } }
        end
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
        
    respond_to do |format|
      
      if !params[:questions].nil? 
        params[:questions].each {
          |q| 
          type = Question.find_by_id(q[0]).question_type
          answer = (type == 2 ? Answer.find_by_id(q[1]).correct : nil)
          Response.new( 
            {
              "question_id" => q[0],
              "answer_id" => type == 2 ? q[1] : nil,
              "text" => type == 1 ? q[1] : nil,
              "user_id" => current_user.id,
              "question_group_id" => params[:response][:question_group_id],
              "correct" => answer
            }
          ).save
        }
        format.html { redirect_to '/responses', notice: 'Your responses were successfully saved.' }
      else
        @response = Response.new(params[:response])
        if @response.save
          format.html { redirect_to @response, notice: 'Response was successfully created.' }
          format.json { render json: @response, status: :created, location: @response }
        end
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
