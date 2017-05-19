#seed table user
user1 = User.create(name: 'Misha', email: 'm@gmail.com', password: 'm')
user2 = User.create(name: 'Bombo', email: 'b@gmail.com', password: 'b')
user3 = User.create(name: 'Cirilo', email: 'c@gmail.com', password: 'c')

game1 = Game.create(user_id: user1.id, destroyed_sub: 2, result: 'Winner!')
game2 = Game.create(user_id: user2.id, destroyed_sub: 1, result: 'Almost!')
game3 = Game.create(user_id: user3.id, destroyed_sub: 0, result: 'Failed!')