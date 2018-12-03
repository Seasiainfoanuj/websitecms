require 'spec_helper'

describe Promotion do

  describe "validations" do 

    before do
      @promotion = build(:promotion)
    end

    subject { @promotion }

    it "should have a valid factory" do
      expect(@promotion).to be_valid
    end

    it { should validate_presence_of :page_name }
    it { should validate_presence_of :title }
    it { should validate_presence_of :status }
    it { should validate_presence_of :visibility }

    it { should respond_to(:feature_description) }
    it { should respond_to(:testimonials) }
    it { should respond_to(:feature_video_url) }
    it { should respond_to(:published_on) }

    it { should validate_uniqueness_of(:page_name) }
    it { should validate_uniqueness_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:changed_by) }
  end

end