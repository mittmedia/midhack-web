class InformationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.information.programme.subject
  #
  def programme(human)
    @receipt_url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    @programme_url = programme_url(uuid: human.uuid, anchor: "programme")

    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Programme released"}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.subject'))
    end
  end

  def data(human)
    @receipt_url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    @programme_url = programme_url(uuid: human.uuid, anchor: "programme")
    @data_url = data_url(uuid: human.uuid)
    @facebook_url = 'https://www.facebook.com/groups/midhack/'
    @kandulova_url = kandulova_url(uuid: human.uuid)
    @kandulova_data_url = 'https://mm-midhack-datadump.herokuapp.com/dumps/kandulova.2015-11-04.zip'
    @overviewnews_url = 'http://overviewnews.com/'

    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Data released"}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.subject'))
    end
  end

  def final_info(human)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    @programme_url = programme_url(uuid: human.uuid, anchor: "programme")
    @facebook_url = 'https://www.facebook.com/groups/midhack/'
    @special_diet_form_url = 'http://goo.gl/forms/tPrlXkVkGo'
    @overviewnews_url = 'http://overviewnews.com/'
    @code_of_conduct_url = what_url(uuid: human.uuid, anchor: "code_of_conduct")

    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Final info"}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.subject'))
    end
  end
end
