class OnboarderController < ApplicationController
  before_action :set_human
  before_action :verify_param_step, only: :tour

  MAX_STEP = 2


  def index
  end

  def tour
    self.send("step#{@step}") unless @step == MAX_STEP
  end

  def why
  end

  def ical
    file_path = Rails.root.join('public', 'downloads', 'invite.ics')
    puts file_path
    send_file file_path, type: 'text/x-vCalendar', filename: 'invite.ics'
  end

  def set_occupation
    # working/student
    # Student: #institution, course, year
    # Working: #Programmer/Entrepenour/Journalist/Other
  end

  private

  def verify_param_step
    if !params[:step].nil? && params[:step].is_a?(Integer) && params[:step] > 0
      @step = params[:step]
    else
      if @human.step.blank?
        @step = 1
      else
        @step = @human.step
      end
    end
  end

  def set_human
    @uuid = cookies[:uuid]
    if @uuid.blank?
      new_human
    else
      @human = Human.find_by(uuid: @uuid)
    end
    new_human or head(500) if @human.nil?
  end

  def new_human
    @human = Human.new
    @human.save!
    cookies[:uuid] = { value: @human.uuid, expires: 1.year.from_now }
  end

  def verify_param_institution
    return false if params[:institution].blank?
    institutions = Occupation.possible_institutions
    if institutions.key? [params[:institution]]
      @institution = params[:institution]
      return true
    end
    false
  end

#
# STEPS
#
  def step1
    @institutions = Occupation.possible_institutions
  end

  def step2
    verify_param_institution or redirect_to tour_path(step: '1'), status: 301
    @courses = Occupation.possible_courses(@institution)
  end
end
