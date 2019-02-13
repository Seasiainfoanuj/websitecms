namespace :promotions do
  desc "Create promotion pages"
  task :create => :environment do
    if Promotion.count == 0
      %w(coasters commuters motorhomes iveco-tonto iveco-trakker).each do |name|
        Promotion.create(
          page_name: name,
          title: name.titleize,
          status: 'draft',
          visibility: 'private',
          feature_description: '<p>Incomplete</p>',
          testimonials: '<h3>Testimonials</h3>',
          feature_video_url: ""
          )
      end  
    else
      puts "Promotion pages exist. None created."
    end      
    puts "Total promotion pages: #{Promotion.count}"  
  end
end
