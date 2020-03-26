# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DESTROY EVERYTHING
puts 'Xau pessoal 👋👋👋'
Answer.destroy_all
Question.destroy_all
EditionItem.destroy_all
Item.destroy_all
Review.destroy_all
Guest.destroy_all
Notification.destroy_all
Member.destroy_all
Edition.destroy_all
EventTag.destroy_all
Event.destroy_all
Tag.destroy_all
User.destroy_all

# USER
puts 'Creating peeps 💁💁‍♀️💁💁‍♀️'
User.create(email: 'riley@lw.com', password: '111111', first_name: 'Riley', last_name: 'Silva')      #0
User.create(email: 'jordan@lw.com', password: '111111', first_name: 'Jordan', last_name: 'Green')    #1
User.create(email: 'taylor@lw.com', password: '111111', first_name: 'Taylor', last_name: 'Bloom')    #2
User.create(email: 'rui@lw.com', password: '111111', first_name: 'Rui', last_name: 'Baltazar')       #3
User.create(email: 'jessie@lw.com', password: '111111', first_name: 'Jessie', last_name: 'Campos')   #4
User.create(email: 'reese@lw.com', password: '111111', first_name: 'Reese', last_name: 'Tyler')      #5
User.create(email: 'skyler@lw.com', password: '111111', first_name: 'Skyler', last_name: 'Sousa')    #6
User.create(email: 'spencer@lw.com', password: '111111', first_name: 'Spencer', last_name: 'Raposo') #7
User.create(email: 'elliott@lw.com', password: '111111', first_name: 'Elliott', last_name: 'White')  #8
User.create(email: 'morgan@lw.com', password: '111111', first_name: 'Morgan', last_name: 'Free')     #9
User.create(email: 'alex@lw.com', password: '111111', first_name: 'Alex', last_name: 'White')        #10


# EVENT
puts 'Creating events 🎭🎤🎪'
Event.create(name: 'Crazy Weekend Getaway 🤪', budget: 80, frequency: 'Every 3 months', user_id: User.all[0].id)
Event.create(name: 'Summer Vay-Kay', budget: 110, frequency: 'Every year', user_id: User.all[1].id)
Event.create(name: 'Home cooked dinner', budget: 10, frequency: 'Every week', user_id: User.all[2].id)
Event.create(name: 'Boardgame night', budget: 7, frequency: 'Every 4 months', user_id: User.all[3].id)
Event.create(name: 'Snowtrip 🎿', budget: 130, frequency: 'Every year', user_id: User.all[3].id)
Event.create(name: 'SecretSessions Movie Night', budget: 15, frequency: 'Every month', user_id: User.all[4].id)
Event.create(name: 'Video Games Party', budget: 5, frequency: 'Every 2 weeks', user_id: User.all[4].id)
Event.create(name: 'Family Reunion', budget: 0, frequency: 'Every month', user_id: User.all[5].id)
Event.create(name: "Dragon's Meetup", budget: 0, frequency: 'Every day', user_id: User.all[2].id)
Event.create(name: 'Live Snake Jazz 🐍🎷', budget: 20, frequency: 'Every month', user_id: User.all[0].id)
Event.create(name: 'Bowling Night 🎳', budget: 25, frequency: 'Twice a week', user_id: User.all[3].id)

# MEMBER
puts 'MEMMMMMMBEEEEERS 👨‍👩‍👧‍👦'

# EVENT 0
Member.create(event_id: Event.all[0].id, user_id: User.all[0].id) # creator
Member.create(event_id: Event.all[0].id, user_id: User.all[1].id)
Member.create(event_id: Event.all[0].id, user_id: User.all[4].id)
Member.create(event_id: Event.all[0].id, user_id: User.all[5].id)

# EVENT 1
Member.create(event_id: Event.all[1].id, user_id: User.all[0].id)
Member.create(event_id: Event.all[1].id, user_id: User.all[1].id) # creator
Member.create(event_id: Event.all[1].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[1].id, user_id: User.all[3].id)

# EVENT 2
Member.create(event_id: Event.all[2].id, user_id: User.all[1].id)
Member.create(event_id: Event.all[2].id, user_id: User.all[2].id) # creator
Member.create(event_id: Event.all[2].id, user_id: User.all[5].id)

# EVENT 3
Member.create(event_id: Event.all[3].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[3].id, user_id: User.all[3].id) # creator
Member.create(event_id: Event.all[3].id, user_id: User.all[4].id)

# EVENT 4
Member.create(event_id: Event.all[4].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[4].id, user_id: User.all[3].id) # creator
Member.create(event_id: Event.all[4].id, user_id: User.all[4].id)
Member.create(event_id: Event.all[4].id, user_id: User.all[7].id)
Member.create(event_id: Event.all[4].id, user_id: User.all[9].id)
Member.create(event_id: Event.all[4].id, user_id: User.all[10].id)

# EVENT 5
Member.create(event_id: Event.all[5].id, user_id: User.all[6].id)
Member.create(event_id: Event.all[5].id, user_id: User.all[5].id)
Member.create(event_id: Event.all[5].id, user_id: User.all[4].id) # creator

# EVENT 6
Member.create(event_id: Event.all[6].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[6].id, user_id: User.all[5].id)
Member.create(event_id: Event.all[6].id, user_id: User.all[9].id) # creator
Member.create(event_id: Event.all[6].id, user_id: User.all[6].id)
Member.create(event_id: Event.all[6].id, user_id: User.all[7].id)
Member.create(event_id: Event.all[6].id, user_id: User.all[8].id)
Member.create(event_id: Event.all[6].id, user_id: User.all[10].id)

# EVENT 7
Member.create(event_id: Event.all[7].id, user_id: User.all[8].id)
Member.create(event_id: Event.all[7].id, user_id: User.all[3].id)
Member.create(event_id: Event.all[7].id, user_id: User.all[5].id) # creator
Member.create(event_id: Event.all[7].id, user_id: User.all[7].id)

# EVENT 8
Member.create(event_id: Event.all[8].id, user_id: User.all[2].id) # creator
Member.create(event_id: Event.all[8].id, user_id: User.all[10].id)
Member.create(event_id: Event.all[8].id, user_id: User.all[4].id)
Member.create(event_id: Event.all[8].id, user_id: User.all[9].id)
Member.create(event_id: Event.all[8].id, user_id: User.all[7].id)

# EVENT 9
Member.create(event_id: Event.all[9].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[9].id, user_id: User.all[0].id) # creator
Member.create(event_id: Event.all[9].id, user_id: User.all[4].id)
Member.create(event_id: Event.all[9].id, user_id: User.all[6].id)
Member.create(event_id: Event.all[9].id, user_id: User.all[9].id)
Member.create(event_id: Event.all[9].id, user_id: User.all[8].id)

# EVENT 10
Member.create(event_id: Event.all[10].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[10].id, user_id: User.all[3].id) # creator
Member.create(event_id: Event.all[10].id, user_id: User.all[4].id)
Member.create(event_id: Event.all[10].id, user_id: User.all[10].id)
Member.create(event_id: Event.all[10].id, user_id: User.all[5].id)
Member.create(event_id: Event.all[10].id, user_id: User.all[8].id)


# EDITION
puts 'Creating editions 🎫'
Edition.create(name: "#{Event.all[0].name} #1", event_id: Event.all[0].id, status: 1, host_id: User.all[1].id, start_time: DateTime.new(2020,4,3), end_time: DateTime.new(2020,4,5))
Edition.create(name: "#{Event.all[1].name} #1", event_id: Event.all[1].id, status: 0, host_id: User.all[2].id)
Edition.create(name: "#{Event.all[2].name} #1", event_id: Event.all[2].id, status: 1, host_id: User.all[2].id, start_time: DateTime.new(2020,3,27), end_time: DateTime.new(2020,3,28))
#Archived edition nr was higher
#Edition.create(name: "#{Event.all[3].name} #2", event_id: Event.all[3].id, status: 0, host_id: User.all[3].id)
Edition.create(name: "#{Event.all[3].name} #1", event_id: Event.all[3].id, status: 2, host_id: User.all[4].id, start_time: DateTime.new(2020,3,5), end_time: DateTime.new(2020,3,6))
Edition.create(name: "#{Event.all[4].name} #1", event_id: Event.all[4].id, status: 0, host_id: User.all[9].id)
Edition.create(name: "#{Event.all[5].name} #1", event_id: Event.all[5].id, status: 0, host_id: User.all[5].id)
Edition.create(name: "#{Event.all[6].name} #1", event_id: Event.all[6].id, status: 0, host_id: User.all[8].id)
Edition.create(name: "#{Event.all[7].name} #1", event_id: Event.all[7].id, status: 0, host_id: User.all[7].id)
Edition.create(name: "#{Event.all[8].name} #1", event_id: Event.all[8].id, status: 1, host_id: User.all[4].id, start_time: DateTime.new(2020,3,25), end_time: DateTime.new(2020,3,26))
Edition.create(name: "#{Event.all[9].name} #1", event_id: Event.all[9].id, status: 1, host_id: User.all[6].id, start_time: DateTime.new(2020,3,13), end_time: DateTime.new(2020,3,14))
Edition.create(name: "#{Event.all[10].name} #1", event_id: Event.all[10].id, status: 0, host_id: User.all[10].id)

# GUEST
puts 'GUEST GUEST GUEST 🎟🎟🎟'
Edition.all[0].event.members.each do |member|
  Guest.create(edition_id: Edition.all[0].id, member_id: member.id)
end

Edition.all[1].event.members.each do |member|
  Guest.create(edition_id: Edition.all[1].id, member_id: member.id)
end

Edition.all[2].event.members.each do |member|
  Guest.create(edition_id: Edition.all[2].id, member_id: member.id)
end

Edition.all[3].event.members.each do |member|
  Guest.create(edition_id: Edition.all[3].id, member_id: member.id)
end

Edition.all[4].event.members.each do |member|
  Guest.create(edition_id: Edition.all[4].id, member_id: member.id)
end

Edition.all[5].event.members.each do |member|
  Guest.create(edition_id: Edition.all[5].id, member_id: member.id)
end

Edition.all[6].event.members.each do |member|
  Guest.create(edition_id: Edition.all[6].id, member_id: member.id)
end

Edition.all[7].event.members.each do |member|
  Guest.create(edition_id: Edition.all[7].id, member_id: member.id)
end

Edition.all[8].event.members.each do |member|
  Guest.create(edition_id: Edition.all[8].id, member_id: member.id)
end

Edition.all[9].event.members.each do |member|
  Guest.create(edition_id: Edition.all[9].id, member_id: member.id)
end

Edition.all[10].event.members.each do |member|
  Guest.create(edition_id: Edition.all[10].id, member_id: member.id)
end

#Edition.all[11].event.members.each do |member|
#  Guest.create(edition_id: Edition.all[11].id, member_id: member.id)
#end

# TAGS
puts 'TAAAAAAGZ 🏷'
Tag.create(name: 'Sports')    #0
Tag.create(name: 'Fitness')   #1
Tag.create(name: 'Business')  #2
Tag.create(name: 'Drink')     #3
Tag.create(name: 'Science')   #4
Tag.create(name: 'Tech')      #5
Tag.create(name: 'Family')    #6
Tag.create(name: 'Education') #7
Tag.create(name: 'Travel')    #8
Tag.create(name: 'Outdoor')   #9
Tag.create(name: 'Hobbies')   #10
Tag.create(name: 'Music')     #11
Tag.create(name: 'Dragons')   #12
Tag.create(name: 'Film')      #13
Tag.create(name: 'Media')     #14
Tag.create(name: 'Arts')      #15
Tag.create(name: 'Dance')     #16
Tag.create(name: 'Charity')   #17
Tag.create(name: 'YEAH🤘')    #18
Tag.create(name: 'Beach')     #19
Tag.create(name: 'Dinner')    #20
Tag.create(name: 'Brunch')    #21
Tag.create(name: 'Party')     #22
Tag.create(name: 'Games')     #23
Tag.create(name: 'Fashion')   #24
Tag.create(name: 'Lunch')     #25
Tag.create(name: 'Indoor')    #26
Tag.create(name: 'Live')      #27
Tag.create(name: 'Surprise')  #28
Tag.create(name: 'Wild')      #29
Tag.create(name: 'Work')      #30
Tag.create(name: 'Pets')      #31
Tag.create(name: 'Kids')      #32

# EVENT TAGS
puts 'generating event tags 🎭🎤🎪🏷'
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[10].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[3].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[18].id)

EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[8].id)
EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[9].id)
EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[18].id)
EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[19].id)

EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[20].id)
EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[3].id)

EventTag.create(event_id: Event.all[3].id, tag_id: Tag.all[3].id)
EventTag.create(event_id: Event.all[3].id, tag_id: Tag.all[12].id)
EventTag.create(event_id: Event.all[3].id, tag_id: Tag.all[23].id)
EventTag.create(event_id: Event.all[3].id, tag_id: Tag.all[10].id)

EventTag.create(event_id: Event.all[4].id, tag_id: Tag.all[0].id)
EventTag.create(event_id: Event.all[4].id, tag_id: Tag.all[8].id)
EventTag.create(event_id: Event.all[4].id, tag_id: Tag.all[9].id)
EventTag.create(event_id: Event.all[4].id, tag_id: Tag.all[10].id)

EventTag.create(event_id: Event.all[5].id, tag_id: Tag.all[13].id)
EventTag.create(event_id: Event.all[5].id, tag_id: Tag.all[14].id)
EventTag.create(event_id: Event.all[5].id, tag_id: Tag.all[15].id)

EventTag.create(event_id: Event.all[6].id, tag_id: Tag.all[23].id)
EventTag.create(event_id: Event.all[6].id, tag_id: Tag.all[22].id)
EventTag.create(event_id: Event.all[6].id, tag_id: Tag.all[18].id)

EventTag.create(event_id: Event.all[7].id, tag_id: Tag.all[6].id)
EventTag.create(event_id: Event.all[7].id, tag_id: Tag.all[20].id)

EventTag.create(event_id: Event.all[8].id, tag_id: Tag.all[12].id)
EventTag.create(event_id: Event.all[8].id, tag_id: Tag.all[18].id)

EventTag.create(event_id: Event.all[9].id, tag_id: Tag.all[11].id)
EventTag.create(event_id: Event.all[9].id, tag_id: Tag.all[27].id)

EventTag.create(event_id: Event.all[10].id, tag_id: Tag.all[22].id)
EventTag.create(event_id: Event.all[10].id, tag_id: Tag.all[23].id)
EventTag.create(event_id: Event.all[10].id, tag_id: Tag.all[10].id)

# ITEMS
puts 'items items items 🧢🍾🧀🤿'
Item.create(name: 'umbrella')
Item.create(name: 'tent')
Item.create(name: 'sleeping bag')
Item.create(name: 'pillow')
Item.create(name: 'cap')
Item.create(name: 'flip-flops')
Item.create(name: 'sunscreen')
Item.create(name: 'bathing suit')
Item.create(name: 'cheese')
Item.create(name: 'wine bottle')
Item.create(name: 'dessert')
Item.create(name: 'beer')
Item.create(name: 'card deck')
Item.create(name: 'poker chips')
Item.create(name: 'cash money')
Item.create(name: 'pizza')
Item.create(name: 'masks')
Item.create(name: 'underwear')
Item.create(name: 'beach ball')
Item.create(name: 'snacks')
Item.create(name: 'sun glasses')
Item.create(name: 'whisky')
Item.create(name: 'piñata')
