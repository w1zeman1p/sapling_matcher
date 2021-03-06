require 'rails_helper'

RSpec.describe ProfileComparison do
  describe '#common_school?' do
    it 'returns true if there is a school in common' do
      unr = create(:school, name: "UNR")
      unr2 = create(:school, name: "UNR")
      a = create(:linkedin_profile, link: "unr", schools: [unr])
      b = create(:linkedin_profile, link: "unr2",schools: [unr2])
      comp = ProfileComparison.new(a, b)
      expect(comp.common_school?).to eq(true)
    end

    it 'returns false if there is not a school in common' do
      unr = create(:school, name: "UNR")
      unlv = create(:school, name: "UNLV")
      a = create(:linkedin_profile, link: "unr", schools: [unr])
      b = create(:linkedin_profile, link: "unr2", schools: [unlv])
      comp = ProfileComparison.new(a, b)
      expect(comp.common_school?).to eq(false)
    end
  end

  describe '#common_location?' do
    it 'returns true if there is a common location' do
      a = create(:linkedin_profile, link: "unr", location: "San Francisco Bay Area")
      b = create(:linkedin_profile, link: "unr2", location: "San Francisco Bay Area")
      comp = ProfileComparison.new(a, b)
      expect(comp.common_location?).to eq(true)
    end

    it 'returns false if the locations are different' do
      a = create(:linkedin_profile,  link: "unr", location: "San Francisco Bay Area")
      b = create(:linkedin_profile, link: "unr2", location: "Reno")
      comp = ProfileComparison.new(a, b)
      expect(comp.common_location?).to eq(false)
    end
  end

  describe '#common_company?' do
    it 'returns true if there is a common company' do
      aapl = create(:company, company: "AAPL")
      aapl2 = create(:company, company: "AAPL")
      a = create(:linkedin_profile, link: "unr", companies: [aapl])
      b = create(:linkedin_profile,link:"unr2", companies: [aapl2])
      comp = ProfileComparison.new(a, b)
      expect(comp.common_company?).to eq(true)
    end

    it 'returns false if the locations are different' do
      aapl = create(:company, company: "AAPL")
      goog = create(:company, company: "GOOG")
      a = create(:linkedin_profile, link: "unr", companies: [aapl])
      b = create(:linkedin_profile, link: "unr2", companies: [goog])
      comp = ProfileComparison.new(a, b)
      expect(comp.common_company?).to eq(false)
    end
  end
end
