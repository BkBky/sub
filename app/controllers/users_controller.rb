# GETS ============================================

get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
  #¿Qué va en esta parte para registrar al jugador?
  p name = params[:name]
  p email = params[:email]
  p password = params[:password]
  # p password = params[:password]
   p "en signup"
  # Creamos una instancia de la clase User con sus atributos necesarios
  user  = User.new(name: name, email: email, password: password)
  # Si el usuario se guardó en la DB, redirige a su perfil, de otra forma
  # vuelve a mostrar el formulario.
  if user.save
    #I declare message for used, I can see it on view/layout
    session[:successfull] = 'Successfull register'
    redirect to '/secret'
  else
    session[:errors] = 'User and/or password does exit. Try again.'
    redirect to '/'
  end
	
end