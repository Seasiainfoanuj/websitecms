FactoryGirl.define do

  factory :promotion do
    changed_by     { User.where(role: 'admin').first || create(:user, :admin) }
    sequence(:page_name) {|n| "pro#{n*4}"}
    title      Faker::Lorem.word
    visibility 'public'
    status     'published'
    feature_description Faker::Lorem.paragraph(2, true)
    feature_video_url 'www.nice_videos/video-1' 
    published_on Time.now
  end

end
