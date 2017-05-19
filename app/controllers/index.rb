enable :sessions
before '/secret' do 
  #¿Qué va en esta parte para aplicar el filtro que da entrada al juego?
  unless session[:user_id]
    session[:error] = "You are not logged"
    #I need to redirect to index to avoid go to /secret again
    redirect to '/'
  end
end 

get '/' do
  erb :index
end

get '/secret' do
  p @user = User.find_by_id(current_user.id)
  
  erb :secret
end
