class CurriculumsController < ApplicationController

  before_action :authenticate_user!

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  def new
    @student = Student.find(params[:student_id])
    @curriculum = Curriculum.new
  end

  def create
    @student = Student.find(params[:student_id])
    @curriculum = @student.curriculums.build(curriculum_params)

    if @curriculum.save
      flash[:notice] = "Curriculum was saved successfully."
      redirect_to [@student, @curriculum]
    else
      flash.now[:alert] = "There was an error saving your curriculum. Please try again."
      render :new
    end
  end

  def edit
    @curriculum = Curriculum.find(params[:id])
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    @curriculum.assign_attributes(curriculum_params)

    if @curriculum.save
      flash[:notice] = "Curriculum was updated successfully."
      redirect_to [@curriculum.student, @curriculum]
    else
      flash.now[:alert] = "There was an error saving the Curriculum. Please try again."
      render :edit
    end
  end

  def destroy
    @curriculum = Curriculum.find(params[:id])

    if @curriculum.destroy
      flash[:notice] = "Curriculum was deleted successfully."
      redirect_to students_path
    else
      flash.now[:alert] = "There was an error deleting the curriculum."
      render :show
    end
  end

  private

  def curriculum_params
      params.require(:curriculum).permit(:title,
                                         :reading,
                                         :writing,
                                         :math,
                                         :science,
                                         :history,
                                         :foreign_lang,
                                         :sports,
                                         :music,
                                         :visual_art,
                                         :performing_art,
                                         :field_trip,
                                         :trade_skill,
                                         :health,
                                         :computer,
                                         :community,
                                         :home_eco,
                                         :elective,
                                         :misc)
  end
end
