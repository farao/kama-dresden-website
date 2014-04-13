class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
  end

  def dates
    start_date = Time.at(params[:start].to_i)
    end_date = Time.at(params[:end].to_i)

    courses = Course.between(start_date, end_date)

    dates = []
    courses.each do |course|
      course.course_dates.each do |course_date|
        date = {
          id: course_date.id,
          title: course.name,
          allDay: false,
          start: course_date.time.to_i,
          end: course_date.end.to_i,
          url: course_path(course.id),
          editable: true
        }
        dates << date
      end
    end

    respond_to do |format|
      format.json { render json: dates }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    @year = params[:year]
    @month = params[:month]
    @day = params[:day]
  end

  # GET /courses/1/edit
  def edit
    @course = Course.get(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user = current_user # restrict & only if params[user..] not set

    p course_params

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path(), notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      #params.require(:course).permit!
      params.require(:course).permit(:name, :description, :category_id, :user_id).tap do |whitelisted|
        whitelisted[:course_dates_attributes] = params[:course][:course_dates_attributes]
      end
      #if current_user.admin?
      #  attributes = [:name, :description, :category_id, :user_id, course_dates_attributes: params[:course][:course_dates_attributes]]
      #  params.require(:course).permit(*attributes)
      #else
      #  params.require(:course).permit(:name, :description, :category_id, course_dates_attributes: [:time, :place, :_destroy])
      #end
    end
end
