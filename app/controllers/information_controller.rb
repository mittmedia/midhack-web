class InformationController < ApplicationController
  def index
  end

  def policy
  end

  def data
    @nr_spots_left = total_nr_of_spots_left
    @signed_up = @human.signed_up
    @on_waiting_list = @human.on_waitlist?
    @data_categories = DataCategory.all.includes(:data_entry)
  end

  def programme
    @nr_spots_left = total_nr_of_spots_left
    @signed_up = @human.signed_up
    @on_waiting_list = @human.on_waitlist?
  end

  def what
    @nr_spots_left = total_nr_of_spots_left
    @signed_up = @human.signed_up
    @on_waiting_list = @human.on_waitlist?
  end

  def total_nr_of_spots_left
    spots_taken = Human.all.select(&:signed_up).count
    Rails.configuration.midhack_total_nr_spots - spots_taken
  end

  def kandulova
    file_path = Rails.root.join('public', 'downloads', 'kandulova.dump')
    send_file file_path, type: 'application/octet-stream', filename: 'kandulova.dump'
  end

  private

  def uuid_param
    params.permit("uuid")["uuid"]
  end
end
