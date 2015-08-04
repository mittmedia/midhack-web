class OnboarderController < ApplicationController
  before_action :set_human
  before_action :verify_param_step, only: :tour

  def index
  end

  def tour
    stepname = "step#{@step}"
    if send(stepname)
      if @jump_to.blank?
        render stepname
      else
        render "step#{@jump_to}"
      end
    else
      redirect_to(tour_path(step: @step - 1), status: 301)
    end
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


  def self.next_step(step)
    step += 1
  end

  private

  def verify_param_step
    if !params[:step].nil? && params[:step].to_i.is_a?(Integer) && params[:step].to_i > 0
      @step = params[:step].to_i
    else
      if @human.step.blank?
        @step = 1
      else
        @step = @human.step.to_i
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
    new_human if @human.nil?
  end

  def new_human
    @human = Human.new
    @human.save!
    cookies[:uuid] = { value: @human.uuid, expires: 1.year.from_now }
  end

  def valid_param_occupation
    return false if params['occupation'].blank?
    @occupation = nil
    occupations = Occupation.possible_occupations
    occupations.each do |elem|
      if elem[:code].to_s == params['occupation'].to_s
        @occupation = elem[:code]
      end
    end
    return true unless @occupation.nil?
    false
  end

  def valid_param_institution
    return false if params['institution'].blank?
    @institution = nil
    institutions = Occupation.possible_institutions
    institutions.each do |elem|
      if elem[:code].to_s == params['institution'].to_s
        @institution = elem[:code]
      end
    end
    return true unless @institution.nil?
    false
  end

  def valid_param_course
    return false if params['course'].blank?
    @course = nil
    courses = Occupation.possible_courses(@institution)
    courses.each do |elem|
      if elem[:code].to_s == params['course'].to_s
        @course = elem[:code]
      end
    end
    return true unless @course.nil?
    false
  end

  def valid_param_year
    year = params['year']
    return false if year.nil?
    return false unless year.is_a?(Integer)
    return false unless year > 0 && year < 11
    @year = year
  end

  #
  # STEP DEFINITIONS
  #

  # Define occupation type.
  def step1
    @occupations = Occupation.possible_occupations
    true
  end

  # IF student, choose instituion.
  def step2
    return false unless valid_param_occupation
    @institutions = Occupation.possible_institutions
    true
  end

  # IF student, choose course
  def step3
    return false unless valid_param_institution
    @courses = Occupation.possible_courses(@institution)
    true
  end

  # IF student, choose year.
  def step4
    return false unless valid_param_institution
    return false unless valid_param_course
    @years = [1,2,3,4,5,7,8,9,10]
    true
  end

  # Set knowledges
  def step5
    return false unless valid_param_institution
    return false unless valid_param_course
    return false unless valid_param_year

    true
  end
end
