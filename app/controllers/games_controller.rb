get '/score/:user_id' do
  #¿Qué va en esta parte para obtener la puntuación de cada jugador (submarinos destruidos en cada ronda) y
  #número de juegos ganados?
  p "score user id"
  p user = params[:user_id]
  @user = User.find_by_id(current_user.id)
  # p @rounds=Game.where(user_id: user)
  p @rounds = @user.games
  erb :round
end

post '/games' do
  p "en games"
  # ¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?
  p params[:counter1]
  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
    
  if params[:counter1] == "2"
    game = Game.create(user_id: current_user.id, destroyed_sub: params[:counter1], result: "Winner!")
    if game.save
      p "guardo con winner"
    end
  end
  if params[:counter1] == "1"
    game = Game.create(user_id: current_user.id, destroyed_sub: params[:counter1], result: "Almost!")
    if game.save
      p "guardo con Almost"
    end
  end
  if params[:counter1] == "0"
    game = Game.create(user_id: current_user.id, destroyed_sub: params[:counter1], result: "Failed!")
    if game.save
      p "guardo perdiendo"
    end
  end

  
  
end

post '/new_game' do
  #¿Qué va en esta parte para redirigir a secret?
  p @user = User.find_by_id(current_user.id)
  
  erb :secret
 
end
