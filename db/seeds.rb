# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create([{firstName: "Jack", lastName: "Black", classYear: 2010, advisor: "Terry Crews", intro: "Hey how's it going? I'm Jack! And today, I'm here to tell you about the word, octagon! Now octagon is an amazing shape that has eight fantastic sides, and eight awesome angles!", research: ["Octagons", "Stop Signs"], colleagues: ["Elmo", "Terry Crews"], careers: ["Kung Fu Panda"], profilePic: "JackElmo.png", password: "Octagons888", email: "jackblack@gmail.com"}])
Student.create([{firstName: "Bob", lastName: "Stupid", classYear: 2016, advisor: "Don Dumb", intro: "Another test profile.", research: ["Coding","Being Smart"], colleagues: [], careers: ["McDonalds, Chipotle"], profilePic: "stup.jpg", password: "imprettyDumb34", email: "beegdumb@gamil.com"}])
Student.create([{firstName: "Bob", lastName: "Smhat", classYear: 2016, advisor: "Don Dumber", intro: "Another test profile.", research: ["Coding","Being Dumb"], colleagues: [], careers: ["McDonalds, Chipotle"], profilePic: "stup.jpg", password: "imprettyDumb34", email: "beegdumb@gamil.com"}])
Student.create([{firstName: "Bob", lastName: "Robertson", classYear: 2016, advisor: "Donny", intro: "Another test profile.", research: ["Coding","Being Smart"], colleagues: [], careers: ["McDonalds, Chipotle"], profilePic: "stup.jpg", password: "imprettyDumb34", email: "beegdumb@gamil.com"}])
Conversation.create()