class OnboarderController < ApplicationController
  def index
  end

  def tour
    @uuid = cookies[:uuid]
    if @uuid.blank?
      @human = Human.new()
      @human.save!
      cookies[:uuid] = { value: @human.uuid, expires: 1.year.from_now }
    else
      @human = Human.find_by(uuid: @uuid)
    end
    @studies = Human.possible_studies
  end

  def why
  end

  def ical
	file_path = Rails.root.join('public','downloads', 'invite.ics')
	puts file_path
	  send_file file_path, type: 'text/calendar'
  end
end
