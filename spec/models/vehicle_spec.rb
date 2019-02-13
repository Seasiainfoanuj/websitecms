require 'spec_helper'

describe Vehicle do

  describe "validations" do 

    let(:vehicle) { create(:vehicle) }

    before do
    end

    subject { vehicle }

    it "should have a valid factory" do
      expect(vehicle).to be_valid
    end

    it { should respond_to(:title) }
    it { should respond_to(:slug) }
    it { should respond_to(:visibility) }
    it { should respond_to(:order) }
    it { should respond_to(:make) }
    it { should respond_to(:model) }
    it { should respond_to(:transmission) }
    it { should respond_to(:specification) }
    it { should respond_to(:seating_capacity) }
    it { should respond_to(:kit) }
    it { should respond_to(:for_hire) }
    it { should respond_to(:featured_image) }
    it { should respond_to(:manufacturer_logo) }
    it { should respond_to(:gallery_id) }
    it { should respond_to(:overview) }
    it { should respond_to(:features) }
    it { should respond_to(:specifications) }
    it { should respond_to(:meta_description) }
    it { should respond_to(:meta_keywords) }
    it { should respond_to(:brochure) }

    it "should ensure that the slug must be unique" do
      vehicle.save!
      vehicle_dup = vehicle.dup
      expect(vehicle_dup).not_to be_valid
    end

    it "should ensure the title cannot be blank" do
      vehicle.title = ""
      expect(vehicle).not_to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:related) }
    it { should have_many(:related_vehicles) }
    it { should have_many(:referenced) }
    it { should have_many(:referenced_vehicles) }
  end

end