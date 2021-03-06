class InformationController < ApplicationController
  def index
  end

  def policy
  end

  def data
    @data_categories = DataCategory.all.includes(:data_entry)
  end

  def programme
  end

  def what
    # @nr_spots_left = total_nr_of_spots_left
  end

  def total_nr_of_spots_left
    spots_taken = Human.all.select(&:signed_up).count
    Rails.configuration.midhack_total_nr_spots - spots_taken
  end

  private

  def uuid_param
    params.permit("uuid")["uuid"]
  end
end
