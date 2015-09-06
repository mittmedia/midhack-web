require "spec_helper"
include OnboarderHelper

# closingtime = 2015-11-14 10:00:00 +0100
#

describe OnboarderHelper do
  describe "#calculate_expiration_time" do
    it 'should return +3 days if more than 6 days remaining' do
      now = DateTime.parse("2015-11-08 09:59:59 +0100")
      Timecop.freeze(now)
      dt = calculate_expiration_time
      expect(dt).to eq(DateTime.parse("2015-11-11 09:59:59 +0100"))
    end
 
    it 'should return +3 days if on the 6 days boundary' do
      now = DateTime.parse("2015-11-08 10:00:00 +0100")
      Timecop.freeze(now)
      dt = calculate_expiration_time
      expect(dt).to eq(DateTime.parse("2015-11-11 10:00:00 +0100"))
    end
 
    it 'should return +2 hours if less than 6 days remaining' do
      now = DateTime.parse("2015-11-08 10:00:01 +0100")
      Timecop.freeze(now)
      dt = calculate_expiration_time
      expect(dt).to eq(DateTime.parse("2015-11-08 12:00:01 +0100"))
    end
  end
end
