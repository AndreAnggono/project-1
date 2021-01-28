User.destroy_all
u1 = User.create :username => 'ac', :first_name => 'andre', :last_name => 'caleb', :email => 'ac@ga.co', :password => 'chicken', :city => 'Sydney', :admin => true
u2 = User.create :username => 'purplehippo', :first_name => 'bill', :last_name => 'murray', :email => 'bmy@ga.co', :password => 'chicken', :city => "Melbourne"
u3 = User.create :username => 'thegrinch',:first_name => 'craig', :last_name => 'gibson', :email => 'cg@ga.co', :password => 'chicken', :city => "Perth"
puts "#{User.count} users"

Destination.destroy_all
d1 = Destination.create :name => 'general assembly sydney', :address => 'the podium building, 1 market st, sydney nsw 2000', :contact => '+61283182912', :website => 'https://generalassemb.ly/sydney', :overview => 'Learning centre providing bootcamps for Software Engineering, UX, Data Science and many more', :rating => 5.0, :latitude => -33.8712676, :longitude => 151.2045322
d2 = Destination.create :name => 'sydney opera house', :address => 'bennelong point, sydney nsw 2000', :contact => '+61292507111', :website => 'https://www.sydneyoperahouse.com/', :overview => 'Landmark, skyline-dominating arts centre for opera, theatre, music and dance, plus guided tours.', :rating => 4.0, :latitude => -33.856756837263184, :longitude => 151.21519851719373
d3 = Destination.create :name => 'gami chicken & beer', :address => '178 clarence st, sydney nsw 2000', :contact => '+61292623000', :website => 'https://www.gamichicken.com.au', :overview => 'Korean Restaurant serving quality korean fried chicken and beer', :rating => 3.0, :latitude => -33.87032130941675, :longitude => 151.20567808424545
puts "#{Destination.count} destinations"

Review.destroy_all
r1 = Review.create :description => 'Great place to learn to code', :date_of_experience => '2021-01-01', :rating => '5'
r2 = Review.create :description => 'Amazing Place and atmosphere to learn!', :date_of_experience => '2020-12-10', :rating => '5'
r3 = Review.create :description => 'The place to be to learn!', :date_of_experience => '2020-12-20', :rating => '5'
r4 = Review.create :description => 'Iconic place! Must visit!', :date_of_experience => '2020-11-13', :rating => '5'
r5 = Review.create :description => "It's nice. But expected more.", :date_of_experience => '2020-08-11', :rating => '4'
r6 = Review.create :description => 'Overhyped and overpriced.', :date_of_experience => '2020-09-29', :rating => '3'
r7 = Review.create :description => 'AMAZING FRIEND CHICKEN! Great food and friendly staff!', :date_of_experience => '2020-10-10', :rating => '5'
r8 = Review.create :description => "Pretty good chicken. KFC is still better", :date_of_experience => '2020-09-11', :rating => '3'
r9 = Review.create :description => 'Rude staff and food was undercooked! AVOID AT ALL COSTS!', :date_of_experience => '2020-08-10', :rating => '1'
puts "#{Review.count} reviews"

# Destination - Reviews Associations
d1.reviews << r1 << r2 << r3
d2.reviews << r4 << r5 << r6
d3.reviews << r7 << r8 << r9

# User - Reviews Associations
u1.reviews << r1 << r4 << r7
u2.reviews << r2 << r5 << r8
u3.reviews << r3 << r6 << r9
