import quilomberos.*
import cuidadores.*

// La interfaz de casa son todos los mensajes que entiende.

object casa {
	var cuidador = tom
	var quilombero = jerry
	var suciedad = 0
	
	method pasarElDia(){
		cuidador.limpiarCasa()
		self.intentarEcharQuilombero()
	}
	
	method pasarLaNoche(){
		cuidador.dormir()
		quilombero.hacerQuilombo()
	}
	
	method reducirSuciedad(cantidad){
		// El enunciado no dice nada sobre valores negativos, 
		// asi que asumimos que son validos y que no tenemos que 
		// asegurarnos que la suciedad no sea menor que 0
		suciedad -= cantidad 
	}
	
	
	// Seria mas adecuado que este mensaje lo entiendan los cuidadores,
	// pero con las herramientas que tenemos ahora tendriamos que
	// repetir logica copy pasteando este metodo en cada uno de los cuidadores.
	// Mas adelante vamos a ver como hacer que los cuidadores entiendan
	// este mensaje y que tengan el mismo comportamiento sin repetir logica.
	method intentarEcharQuilombero(){ 
		if(cuidador.puedeAtrapar(quilombero)){
			self.quilombero(quilomberoNulo)
		}
	}
	
	method quedarTotalmenteLimpia(){
		suciedad = 0
	}
	
	method ensuciarse(cantidad){
		suciedad += cantidad
	}
	
	method quilombero(otroQuilombero){
		quilombero = otroQuilombero
	}
	
	method llenarDeRuido(){
		cuidador.interrumpirSuenio()
	}
	
	method suciedad() = suciedad
	
	
	//Setter y getter para los tests
	method cuidador(otroCuidador){
		cuidador = otroCuidador
	}
	
	method quilombero() = quilombero
}
