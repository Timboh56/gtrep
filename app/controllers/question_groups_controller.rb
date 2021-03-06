class QuestionGroupsController < ApplicationController
  # GET /question_groups
  # GET /question_groups.json
  def index
    @question_groups = current_user.top_role == 3 ? QuestionGroup.open_question_groups.order("name") : QuestionGroup.order("name")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_groups }
    end
  end

  # GET /question_groups/1
  # GET /question_groups/1.json
  def show
    @question_group = QuestionGroup.find(params[:id])
    @question_group_questions = QuestionGroupQuestion.find_all_by_question_group_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_group }
    end
  end

  # GET /question_groups/new
  # GET /question_groups/new.json
  def new
    @question_group = QuestionGroup.new
    @question_group_questions = @question_group.question_group_questions.new
    
    # Get all questions so user can add questions
    @questions = Question.all 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_group }
    end
  end

  # GET /question_groups/1/edit
  def edit
    @question_group = QuestionGroup.find(params[:id])
        
    # original list of questions in the question group specified by parameters
    @orig_question_group_questions = QuestionGroupQuestion.find_all_by_question_group_id(params[:id])
    
    # list of all questions for selector that allows users to add new questions
    # subject to change with a search textfield
    @questions = Question.all
        
  end

  # POST /question_groups
  # POST /question_groups.json
  def create
    # Get all questions so user can add questions
    # CHANGE SO THAT THIS ONLY APPEARS IF VALIDATION FAILS
    @questions = Question.all 
    
    @question_group = QuestionGroup.new(params[:question_group])
    @question_group.user = current_user
    puts(params.to_s)
    respond_to do |format|
      if @question_group.save
        
        # save all dynamically added questions from form
        # TO-DO: ADD ERROR HANDLING IF NO QUESTIONS WERE SUBMITTED THROUGH VALIDATION
        params[:question_group_questions][:question_ids].each {
          |q| @question_group_questions = QuestionGroupQuestion.new(
            {
              "question_id" => q, 
              "question_group_id" => @question_group.id
            }
          )
          @question_group_questions.save
        }
             
        format.html { redirect_to @question_group, notice: 'Question group was successfully created.' }
        format.json { render json: @question_group, status: :created, location: @question_group }
      else
        format.html { render action: "new" }
        format.json { render json: @question_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_groups/1
  # PUT /question_groups/1.json
  def update
    @question_group = QuestionGroup.find(params[:id])
    
    # original list of questions, select question_id column where question_group_id = params[:id]
    # convert the results into an array ,convert the array into an array of question_ids in string format
    # rather than question group models
    orig_question_group_questions = QuestionGroupQuestion.where("question_group_id" => params[:id]).select("question_id").collect { |q| q.question_id.to_s}

    respond_to do |format|
      if @question_group.update_attributes(params[:question_group])
        
        # get all the question_group_questions for this question group. if none were submitted, then initialize an empty array
        new_question_group_questions = params[:question_group_questions].nil? ? Array.new : params[:question_group_questions][:question_ids]

        puts("______________________________ " + new_question_group_questions.to_s)
        puts("______________________________ " + orig_question_group_questions.to_s)
        
        # test if the original set of questions is not the same as the updated set
        if orig_question_group_questions != new_question_group_questions
          @question_group_questions_add = new_question_group_questions - orig_question_group_questions
          
          # for each newly added question, add to database
          @question_group_questions_add.each { 
            |add| 
            new_question_group_question = QuestionGroupQuestion.new(
              {
                :question_id => add,
                :question_group_id => params[:id] 
              }
            ).save
          }
          
          @question_group_questions_remove = orig_question_group_questions - new_question_group_questions
          
          # remove each question_group_question from the computed remove list
          @question_group_questions_remove.each { 
            |question| QuestionGroupQuestion.where(
              :question_group_id => params[:id],
              :question_id => question
            ).destroy_all
          }
          
        end
            
        format.html { redirect_to @question_group, notice: 'Question group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_groups/1
  # DELETE /question_groups/1.json
  def destroy
    @question_group = QuestionGroup.find(params[:id])
    @question_group.destroy

    respond_to do |format|
      format.html { redirect_to question_groups_url }
      format.json { head :no_content }
    end
  end
end
