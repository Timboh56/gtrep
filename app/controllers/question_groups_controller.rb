class QuestionGroupsController < ApplicationController
  # GET /question_groups
  # GET /question_groups.json
  def index
    @question_groups = QuestionGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_groups }
    end
  end

  # GET /question_groups/1
  # GET /question_groups/1.json
  def show
    @question_group = QuestionGroup.find(params[:id])
    @question_group_questions = QuestionGroupQuestion.find_all_by_question_group_id(params[:id]);

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
    @questions = Question.all rescue "wtf"
    @question_group_questions = QuestionGroupQuestion.find_all_by_question_group_id(params[:id]) rescue "No question exists"
    
    
  end

  # POST /question_groups
  # POST /question_groups.json
  def create
    params[:question_group][:user_id]= current_user.id

    @question_group = QuestionGroup.new(params[:question_group])
    puts("tits" + params[:question_group_questions].to_s)

    respond_to do |format|
      if @question_group.save
        
        # save all dynamically added questions from form
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

    respond_to do |format|
      if @question_group.update_attributes(params[:question_group])
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
