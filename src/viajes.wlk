class Viaje {
	const idiomas = #{}
	
	method implicaEsfuerzo() 
	method sirveParaBroncearse() = true
	method diasQueLleva() 
	method esInteresante() = idiomas.size() > 1
	
}

class ViajeDePlaya inherits Viaje{
	const largo 
	
	override method diasQueLleva() = largo/500
	override method implicaEsfuerzo() = largo > 1200
}

class ExcursionACiudad inherits Viaje {
	const atracciones
	
	override method diasQueLleva() = atracciones/2
	override method implicaEsfuerzo() = atracciones.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or atracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	override method diasQueLleva() = super() + 1
	override method sirveParaBroncearse() = true
}

class Trekking inherits Viaje{
	const kmSenderos 
	const diasDeSolXAnio
	
	override method diasQueLleva() = kmSenderos/50
	override method implicaEsfuerzo() = kmSenderos > 80
	override method sirveParaBroncearse() = diasDeSolXAnio > 200 or (diasDeSolXAnio.between(100,200) and kmSenderos > 120)
	override method esInteresante() = super() and diasDeSolXAnio > 140
}