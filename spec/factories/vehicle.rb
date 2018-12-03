FactoryGirl.define do

  factory :vehicle do
    title      Faker::Lorem.word
    sequence(:slug) {|n| "VEH-#{n}"}
    visibility Faker::Lorem.word
    order      'ASC'
    make       Faker::Lorem.word
    model      Faker::Lorem.word
    transmission 'Manual'
    specification 'Coach / Mine Spec / School Bus'
    seating_capacity Faker::Number.between(4, 40)
    kit 'N/A'
    for_hire true
    featured_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'rails.png')) }
    manufacturer_logo nil
    gallery_id nil
    overview   Faker::Lorem.paragraph(2, true)
    features   Faker::Lorem.sentence(3) 
    specifications   Faker::Lorem.paragraph(2, true)
    meta_description Faker::Lorem.paragraph
    meta_keywords    Faker::Lorem.words(4)
    brochure nil
  end

end


