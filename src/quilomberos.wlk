import casa.*

// Cada objeto quilombero tiene su propia interfaz individual (osea todos los mensajes que entienden)

// En general la interfaz de "quilombero" son los mensajes hacerQuilombo() y velocidad()

// Tambien es valido pensar la interfaz relativa a quienes usan a los quilomberos:

// Para la casa un quilombero es un objeto que tiene la interfaz de entender el mensaje hacerQuilombo()
// Para los cuidadores un quilombero es un objeto que tiene la interfaz de entender el mensaje velocidad()

object jerry{
	var peso = 10
	
	method hacerQuilombo(){
		casa.ensuciarse(110)
		self.aumentarPeso(1)
	}
	
	method aumentarPeso(cantidad){
		peso += 1
	}
	
	method velocidad() = 10 - peso
	
	
	//Getter para los tests
	method peso() = peso
}

object tuffy {
	
	method velocidad() = 10

	method hacerQuilombo(){
		casa.llenarDeRuido()
	}	
}

object nuevoQuilombero {
	
	// No estaba creativo, perdon.
	
	method velocidad() = 10 + casa.suciedad() / 10
	
	method hacerQuilombo(){ 
		casa.ensuciarse(25)
		casa.llenarDeRuido()
	}	
}

// El objeto quilomberoNulo surge de un patron de diseño que se llama
// "null object" [*] . Esto nos permite tener un objeto que
// reifica (osea crear un objeto que representa una idea)
// la ausencia de un quilombero en la casa. Esto nos permite
// simplificar el codigo ya que cada vez que tenemos que 
// usar al quilombero de la casa no tenemos que verificar 
// si "existe" o no (osea hacer if (quilombero == null){}),
// simplemente le enviamos mensajes sin tener que pensar en eso.

object quilomberoNulo {
	method velocidad() = 0
	method hacerQuilombo(){
		
	}
}

// [*] El patron "null object" no lo es mismo que el objeto null.
// El objeto null es un objeto nativo que existe en wollok (y en otros lenguajes)
// que no entiende ningun mensaje, por lo que explota si intentamos hacerlo.
// "Null object" es un patron de diseño que nos lleva a crear
// objetos como quilomberoNulo que entienden todos los mensajes de la interfaz
// que implementan, en este caso la interfaz de quilombero, y
// tienen un comportamiento "nulo" ante estos mensajes, y de eso viene el nombre del patron "null object",
// no es porque tengan necesariamente relacion con el objeto null.

// Todo esto del patron "null object" no es algo que entre como un tema teorico en si mismo en el parcial,
// lo que importa de esto es poder empezar a pensar de una forma "objetosa", pudiendo identificar
// este tipo de ideas no obvias y transformarlas en objetos (reificar) de forma tal que 
// podamos hacer codigo mas simple y mantenible.