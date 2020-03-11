# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DESTROY EVERYTHING
puts 'Xau pessoal 👋👋👋'
Edition_items.destroy_all
Item.destroy_all
Guest.destroy_all
Member.destroy_all
Edition.destroy_all
EventTag.destroy_all
Event.destroy_all
Tag.destroy_all
User.destroy_all

# USER
puts 'Creating peeps 💁💁‍♀️💁💁‍♀️'
User.create(email: 'test1@t.com', password: '111111', first_name: 'Pedro', last_name: 'Alberto')
User.create(email: 'test2@t.com', password: '111111', first_name: 'Rui', last_name: 'Alberto')
User.create(email: 'test3@t.com', password: '111111', first_name: 'Margarida', last_name: 'Alberto')
User.create(email: 'test4@t.com', password: '111111', first_name: 'Hugo', last_name: 'Alberto')
User.create(email: 'test5@t.com', password: '111111', first_name: 'Luis', last_name: 'Alberto')
User.create(email: 'test6@t.com', password: '111111', first_name: 'Alexandra', last_name: 'Pastel')


# EVENT
puts 'Creating events 🎭🎤🎪'
Event.create(name: 'Weekend Getaway', budget: 80, frequency: 'Every 2 months', user_id: User.all[0].id)
Event.create(name: 'Summer Vay-Kay', budget: 110, frequency: 'Every year', user_id: User.all[1].id)
Event.create(name: 'Home cooked dinner', budget: 10, frequency: 'Every week', user_id: User.all[2].id)
Event.create(name: 'Boardgame night', budget: 5, frequency: 'Every 4 months', user_id: User.all[3].id)

# MEMBER
puts 'MEMMMMMMBEEEEERS 👨‍👩‍👧‍👦'
Member.create(event_id: Event.all[0].id, user_id: User.all[0].id) # creator
Member.create(event_id: Event.all[0].id, user_id: User.all[1].id)
Member.create(event_id: Event.all[0].id, user_id: User.all[4].id)
Member.create(event_id: Event.all[0].id, user_id: User.all[5].id)

Member.create(event_id: Event.all[1].id, user_id: User.all[0].id)
Member.create(event_id: Event.all[1].id, user_id: User.all[1].id) # creator
Member.create(event_id: Event.all[1].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[1].id, user_id: User.all[3].id)

Member.create(event_id: Event.all[2].id, user_id: User.all[1].id)
Member.create(event_id: Event.all[2].id, user_id: User.all[4].id) # creator
Member.create(event_id: Event.all[2].id, user_id: User.all[5].id)

Member.create(event_id: Event.all[3].id, user_id: User.all[2].id)
Member.create(event_id: Event.all[3].id, user_id: User.all[3].id) # creator
Member.create(event_id: Event.all[3].id, user_id: User.all[4].id)

# EDITION
puts 'Creating editions 🎫'
Edition.create(name: "#{Event.all[0].name} #1", event_id: Event.all[0].id, status: 1, host_id: User.all[0].id)
Edition.create(name: "#{Event.all[1].name} #1", event_id: Event.all[1].id, status: 1, host_id: User.all[1].id)
Edition.create(name: "#{Event.all[2].name} #1", event_id: Event.all[2].id, status: 1, host_id: User.all[4].id)
Edition.create(name: "#{Event.all[3].name} #1", event_id: Event.all[3].id, status: 0)
Edition.create(name: "#{Event.all[3].name} #3", event_id: Event.all[3].id, status: 1, host_id: User.all[3].id)
Edition.create(name: "#{Event.all[3].name} #3", event_id: Event.all[3].id, status: 2, host_id: User.all[3].id)

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

# TAGS
puts 'TAAAAAAGZ 🏷'
Tag.create(name: 'Sports')
Tag.create(name: 'Fitness')
Tag.create(name: 'Business')
Tag.create(name: 'Drink')
Tag.create(name: 'Science')
Tag.create(name: 'Tech')
Tag.create(name: 'Family')
Tag.create(name: 'Education')
Tag.create(name: 'Travel')
Tag.create(name: 'Outdoor')
Tag.create(name: 'Hobbies')
Tag.create(name: 'Music')
Tag.create(name: 'Dragons')
Tag.create(name: 'Film')
Tag.create(name: 'Media')
Tag.create(name: 'Arts')
Tag.create(name: 'Dance')
Tag.create(name: 'Charity')
Tag.create(name: 'YEAH🤘')
Tag.create(name: 'Beach')
Tag.create(name: 'Dinner')
Tag.create(name: 'Brunch')
Tag.create(name: 'Party')
Tag.create(name: 'Games')
Tag.create(name: 'Fashion')

# EVENT TAGS
puts 'generating event tags 🎭🎤🎪🏷'
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[3].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[8].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[9].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[18].id)

EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[9].id)
EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[19].id)
EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[22].id)

EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[20].id)
EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[18].id)
EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[3].id)

EventTag.create(event_id: Event.all[3].id, tag_id: Tag.all[22].id)
EventTag.create(event_id: Event.all[3].id, tag_id: Tag.all[23].id)

# ITEMS
puts 'items items items 🧢🍾🧀🤿'
Item.create(edition_id: Edition.all[0].id, name: 'umbrella')
Item.create(edition_id: Edition.all[0].id, name: 'tent')
Item.create(edition_id: Edition.all[0].id, name: 'sleeping bag')
Item.create(edition_id: Edition.all[0].id, name: 'pillow')

Item.create(edition_id: Edition.all[1].id, name: 'cap')
Item.create(edition_id: Edition.all[1].id, name: 'flip-flops')
Item.create(edition_id: Edition.all[1].id, name: 'sunscreen')
Item.create(edition_id: Edition.all[1].id, name: 'bathing suit')

Item.create(edition_id: Edition.all[2].id, name: 'cheese')
Item.create(edition_id: Edition.all[2].id, name: 'wine bottle')
Item.create(edition_id: Edition.all[2].id, name: 'dessert')

Item.create(edition_id: Edition.all[3].id, name: 'beer')
Item.create(edition_id: Edition.all[3].id, name: 'card deck')
Item.create(edition_id: Edition.all[3].id, name: 'poker chips')
