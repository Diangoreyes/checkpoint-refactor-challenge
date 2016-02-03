Horse.delete_all

Horse.create(name: 'Penelope', breed: "Arabian", age: 15, owner_id: 1)
Horse.create(name: 'Pepe', breed: "Thoroughbred", age: 25, owner_id: 2)
Horse.create(name: 'Priscilla', breed: "Pony", age: 17, owner_id: 1)
Horse.create(name: 'Paula', breed: "Andalusian", age: 24, owner_id: 2)
Horse.create(name: 'Polly', breed: "Peruvian Paso", age: 10, owner_id: 1)
Horse.create(name: 'Pablo', breed: "Icelandic", age: 8, owner_id: 2)

User.delete_all

User.create(name: "Lindsey", email: "lindsey@email.com", password: "123456")
User.create(name: "Jon", email: "jon@email.com", password: "654321")
