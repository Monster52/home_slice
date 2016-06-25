class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new
    @student.name = params[:student][:name]
    @student.grade = params[:student][:grade]

    if @student.save
      flash[:notice] = "Student was saved successfully."
      redirect_to @student
    else
      flash.now[:alert] = "There was an error saving your student. Please try again."
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.name = params[:student][:name]
    @student.grade = params[:student][:grade]

    if @student.save
      flash[:notice] = "Student was saved successfully."
      redirect_to @student
    else
      flash.now[:alert] = "There was an error saving your student. Please try again."
      render :edit
    end
  end

  def destroy
  @student = Student.find(params[:id])

  if @student.destroy
    flash[:notice] = "\"#{@student.name}\" was deleted successfully."
    redirect_to students_path
  else
    flash.now[:alert] = "There was an error deleting the student."
    render :show
  end
end
end
