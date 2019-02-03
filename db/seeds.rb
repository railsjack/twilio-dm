# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#user = User.create({name: 'WebDev', email: 'jinnahrae@gmail.com', password: 'fofjrj123'})
#user = User.create({name: 'demo', email: 'demo@webmobiledev.com', password: 'demo123'})

Message.destroy_all

# to: '+1(850)270-1639',
new_message = Message.create ({
    from: '+1(970)366-4458',
    to: '+1(850)270-1639',
    content: "Hi, I'm looking for a new product for my jeep",
    seen: false
})
new_message.save
new_message = Message.create ({
    to: '+1(970)366-4458',
    from: '+1(850)270-1639',
    content: "What year is your jeep?",
    seen: false
})
new_message.save
new_message = Message.create ({
    from: '+1(970)366-4458',
    to: '+1(850)270-1639',
    content: "I have a jeep wrangler 2018.",
    seen: false
})
new_message.save

new_message = Message.create ({
    from: '+1(970)366-8888',
    to: '+1(850)270-1639',
    content: "Hey what's up - I'm just testing to see if this works",
    seen: false
})
new_message.save

