get '/records' do
  #¿Qué va en esta parte para obtener la lista de ganadores (juegos ganados)? Ordenados en orden descendente
  @round_won = Hash.new
  # ** se crea un hash 
  group_winner = Game.where(result: "Winner!").group_by do |user| 
    user.user_id
  end
  # group_winner es similar a esto{1=>[#<Game id: 1, user_id: 1, destroyed_sub: 2, result: "Winner!"...>]}
  # iterar hashes que contendrá el user_id y sus registros de "Winner!" agrupados
  group_winner.each do |user_id, registers|
    p user_id
    name = User.find(user_id).name
    p registers
     counter = registers.count
    p @round_won [name] = counter  
  end
  # este codigo establece el orden ascendente por el value (registers)
  @round_won = @round_won.sort_by{|user_id, register| [-register, user_id]} 
  erb :record 
end