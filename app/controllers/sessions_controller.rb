# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
  #¿Qué va en esta parte para cerrar la sesión?
  #I need to clear session to be clean it.
  session.clear
  session[:successfull] = "You Loggout correctly"
  redirect to '/'
end

# POSTS ============================================

post '/signin' do
  #¿Qué va en esta parte para ingresar al juego?
  #I Obtain user inputs
  @email = params[:email]
  @password = params[:password]
  p "dentro de signin"
  @user = User.authenticate(@email, @password)
  if @user
    p session[:user_id] = @user.id
    p "si valido la sesión"
    redirect to "/secret"
  else
  	session[:errors] = "incorrect email and/or password"
    #@error_message_login = "Email y/o password incorrectos"
    p "no vaido a ausuario"
    redirect to '/'
  end

end
