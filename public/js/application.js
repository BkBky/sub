//función que inicia el juego
function start_game(subOne, subTwo) {
  
  //variable que tiene un arreglo asignado con la posición de los dos submarinos a destruir
  var winner = randomCell();
  console.log(winner + "soy winner");
  
    $('.cell').on("click", function(evento){
      //**regresa el valor del id del cuadro al que hicimos click
      var playerClick = $(this).attr('id'); 
      console.log(playerClick + "soy player click");
      var url = $('#play').attr('action');
      //¿qué debería ir aquí para conocer el número de submarinos destruidos o si el jugador es ganador?
      //**playerClick= es click de jugador y winner = lugar donde estan los submarinos
      won(playerClick, winner)
      //countForPlay = conteo de oportunidades por ronda
      countForPlay += 1;
      //¿que debería ir aquí para mandar al controlador el conteo de submarinos destruidos y el
      //conteo de oportunidades por ronda?
    
       if (nowWinner==2 || countForPlay==4) {
        if (nowWinner==2) {
          console.log("soy 2 en post")
          $.post("/games",{counter1: nowWinner});
        }
        if (nowWinner==1){
          console.log("soy 1 en post")
          $.post("/games",{counter1: nowWinner});
        }
        if (nowWinner==0){
          console.log("entre en cero")
          $.post("/games",{counter1: nowWinner});
        }
      }

    });
  
  //función para conocer el número de submarinos destruidos o si el jugador es ganador
  function won(playerValue, subValue) {
    //**nowWinner = conteo de submarinos destruidos
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    //**countForPlay = conteo de oportunidades por ronda
    if (countForPlay <= 2) {
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('#' + playerValue).css("background","red");
        //**variable que lleva el conteo de submarinos destruidos
        nowWinner += 1;
       
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    //¿que debería ir aquí para conocer el número de submarinos destruidos y conocer ganador?
     score(nowWinner);
    
  }
}

//función que muestra el score del jugador
function score(value) {
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  console.log("en resetinit");
  $("#container").empty();
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'white');
  $('#container').css('background','#FFFFFF');
  //¿qué debería ir aquí para generar las celdas cada vez que se inicia juego?
  //** en square definimos la cantidad de cuadros que neesitamos
  var square;
  for (square = 1; square <= 9; square++) {
    //**crear un div con la clase  square
    $("#container").append('<div class="cell"></div>');
    $(".cell"+square).css({"background-color": "#f27500", "width":"33%", "height":"33%"});
    //**asignamos un id a la última celda
    $(".cell:last").attr("id", "c"+square);
  };
}

//función que genera la posición de los dos submarinos
var randomCell = function() {
  //variables para asignar el valor de la posición de los submarinos
  var subOne = 0;
  var subTwo = 0;
  //¿qué debería ir aquí para generar las dos posiciones de los submarinos?
  //** radom que define un rango entre 1 y 9, excluyendo 0
  subOne = Math.floor(1 + Math.random() * 9)
  subTwo = Math.floor(1 + Math.random() * 9)
  //** condición para que la posición de los dos submarinos, no se repita
  if (subOne == subTwo) {
    if (subOne == 9) {
      subOne = subOne - 1;
    }else{
      subOne = subOne + 1;
    }    
  }

  var valueSubOne = "c" + subOne;
  var valueSubTwo = "c" + subTwo;
  return [valueSubOne, valueSubTwo]
}


$(document).ready(function(){
  	$('#play').on("submit", function(evento){
  	  evento.preventDefault();
      var url = $('#play').attr('action');
      $('#win').text(" ");
      //variable que lleva el conteo de oportunidades por ronda
      countForPlay = 0;
      //variable que lleva el conteo de submarinos destruidos
      nowWinner = 0;
      //variable que termina el juego 'alert game over'
      status = false;
      //¿que debería ir aquí para comenzar el juego?
      //**llamada a la funcion resetInit para pintar las celdas
      resetInit();
      //**mando los parámetros de la posición de los dos submarinos
      start_game(randomCell()[0],randomCell()[1]);
      console.log(randomCell()[0]+ " randomCell2");  
      console.log(randomCell()[1] + " randomCell1");

      
  	  
	  });
});