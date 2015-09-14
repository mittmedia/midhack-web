module OnboarderHelper
  def calculate_expiration_time
    closingtime = Rails.configuration.midhack_signup_closed
    now = DateTime.now()
    sugg_expire_boundary = now + 6.days
    if sugg_expire_boundary > closingtime
      return now + 2.hour
    else
      return now + 3.days
    end
  end
end
