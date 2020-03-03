# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DESTROY EVERYTHING
puts 'Xau pessoal!'
Item.destroy_all
Guest.destroy_all
Member.destroy_all
Edition.destroy_all
EventTag.destroy_all
Event.destroy_all
Tag.destroy_all
User.destroy_all

# USER
puts 'Creating peeps'
User.create(email: 'test1@t.com', password: '111111')
User.create(email: 'test2@t.com', password: '111111')
User.create(email: 'test3@t.com', password: '111111')

# EVENT
puts 'Creating events'
Event.create(name: 'Event A', budget: 50, frequency: 'Every 2 months', user_id: User.all[0].id)
Event.create(name: 'Event B', budget: 110, frequency: 'Every year', user_id: User.all[1].id)
Event.create(name: 'Event C', budget: 39470, frequency: 'Every week', user_id: User.all[2].id)

# MEMBER
puts 'MEMMMMMMBEEEEERS!!!!!'
Member.create(event_id: Event.all[0].id, user_id: User.all[0].id)
Member.create(event_id: Event.all[0].id, user_id: User.all[1].id)

Member.create(event_id: Event.all[1].id, user_id: User.all[0].id)
Member.create(event_id: Event.all[1].id, user_id: User.all[1].id)
Member.create(event_id: Event.all[1].id, user_id: User.all[2].id)

Member.create(event_id: Event.all[2].id, user_id: User.all[1].id)
Member.create(event_id: Event.all[2].id, user_id: User.all[2].id)

# EDITION
puts 'Creating editions'
Edition.create(name: 'Event A #1', event_id: Event.all[0].id)
Edition.create(name: 'Event B #1', event_id: Event.all[1].id)
Edition.create(name: 'Event C #1', event_id: Event.all[2].id)

# GUEST
puts 'GUEST GUEST GUEST!!!!!'
Guest.create(edition_id: Edition.all[0].id, member_id: Member.all[0].id)
Guest.create(edition_id: Edition.all[0].id, member_id: Member.all[1].id)

Guest.create(edition_id: Edition.all[1].id, member_id: Member.all[2].id)
Guest.create(edition_id: Edition.all[1].id, member_id: Member.all[4].id)

Guest.create(edition_id: Edition.all[2].id, member_id: Member.all[5].id)
Guest.create(edition_id: Edition.all[2].id, member_id: Member.all[6].id)

# TAGS
puts 'TAAAAAAGZ'
Tag.create(name: 'snow')
Tag.create(name: 'beach')
Tag.create(name: 'paintball')
Tag.create(name: 'bachelor party')
Tag.create(name: 'music')
Tag.create(name: 'yeah!')

# EVENT TAGS
puts 'generating event tags'
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[0].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[2].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[3].id)
EventTag.create(event_id: Event.all[0].id, tag_id: Tag.all[4].id)

EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[1].id)
EventTag.create(event_id: Event.all[1].id, tag_id: Tag.all[3].id)

EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[3].id)
EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[4].id)
EventTag.create(event_id: Event.all[2].id, tag_id: Tag.all[5].id)

# ITEMS
puts 'items items items'
Item.create(edition_id: Edition.all[0].id, name: 'umbrella')
Item.create(edition_id: Edition.all[0].id, name: 'cap')
Item.create(edition_id: Edition.all[0].id, name: 'sunscreen')
Item.create(edition_id: Edition.all[0].id, name: 'bathing suit')
Item.create(edition_id: Edition.all[1].id, name: 'wine bottle')
Item.create(edition_id: Edition.all[1].id, name: 'tent')
Item.create(edition_id: Edition.all[1].id, name: 'sleeping bag')
Item.create(edition_id: Edition.all[2].id, name: 'pillow')
Item.create(edition_id: Edition.all[2].id, name: 'cheese')
Item.create(edition_id: Edition.all[2].id, name: 'mask')
