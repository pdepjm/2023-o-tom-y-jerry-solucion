import casa.*

// Cada objeto cuidador tiene su propia interfaz individual (osea todos los mensajes que entienden)

// En general la interfaz de "cuidador" son los mensajes:
// limpiarCasa() , dormir() , puedeAtrapar(quilombero) e interrumpirSuenio()
// Esto lo sabemos porque la casa, quien es la que usa polimorficamente a los cuidadores,
// le envia esos mensajes a su cuidador.

object tom {
	var energia = 30 // Elijo un valor arbitrario con el cual inicializarlo.
	
	method reducirEnergia(cantidad) {
		// Como con la suciedad de la casa, asumimos que
		// los valores negativos son validos.
		energia -= cantidad
	}
	
	method incrementarEnergia(cantidad) {
		energia += cantidad
	}
	
	method limpiarCasa(){
		casa.reducirSuciedad(100)
		self.reducirEnergia(40)
	}
	
	method dormir(){
		self.incrementarEnergia(50)
	}
	
	method velocidad() = 5 + energia / 10

	method puedeAtrapar(quilombero) = self.velocidad() > quilombero.velocidad()
	
	method interrumpirSuenio(){
		self.reducirEnergia(20)
	}
	
	// Getter para los tests
	method energia() = energia
	
}

object roboCat {
	
	method dormir(){
		
	}
	
	method limpiarCasa(){
		casa.quedarTotalmenteLimpia()
	}
	
	method puedeAtrapar(quilombero) = true
	
	method interrumpirSuenio(){
		
	}
}

object nuevoCuidador {
	var estaEnojado = false
	
	
	method limpiarCasa(){
		if(estaEnojado){
			casa.ensuciarse(10)
		}
		else{
			casa.reducirSuciedad(50)
		}
	}
	
	method puedeAtrapar(quilombero) = not estaEnojado
	
	method dormir(){
		self.tranquilizarse()
	}
	
	method interrumpirSuenio(){
		self.enojarse()
	}
	
	method enojarse(){
		estaEnojado = true
	}
	
	method tranquilizarse(){
		estaEnojado = false
	}
	
}
