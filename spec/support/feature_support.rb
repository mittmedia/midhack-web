module FeatureSupport
  def create_human (factory)
    human = FactoryGirl.create factory
    page.driver.browser.set_cookie "uuid=#{human.uuid}"
    human
  end
  def clear_human
    page.driver.browser.set_cookie "uuid="
  end
end
RSpec.configure { |config| config.include FeatureSupport }
