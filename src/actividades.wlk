class Actividad {
	const property idiomas = #{}
	
	method implicaEsfuerzo() = true
	method sirveParaBroncearse() = true
	method diasQueLleva() 
	method idiomas() = idiomas.asSet()
	method esRecomendadaParaSocio(unSocio)
}

class Viaje inherits Actividad {
	method esInteresante() = idiomas.size() > 1
	override method esRecomendadaParaSocio(unSocio) = self.esInteresante() and unSocio.leAtraeActividad(self) and not unSocio.estaActividadEnLista(self)
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

class ClaseDeGimnasia inherits Actividad {
	override method idiomas() = #{"español"}
	override method diasQueLleva() = 1
	override method sirveParaBroncearse() = false
	override method esRecomendadaParaSocio(unSocio) = unSocio.edad().between(20,30)
}

class TallerLiterario inherits Actividad {
	const libros = #{}
	
	method idiomasUsados() = libros.map({l => l.idioma()})
	override method diasQueLleva() = self.cantidadDeLibros() + 1
	method cantidadDeLibros() = libros.size()
	override method implicaEsfuerzo() = self.hayLibroDeMasDe500() or (self.sonTodosDelMismoAutor() and libros.size() > 1)
	method hayLibroDeMasDe500() = libros.any({l => l.paginas() > 500})
	method listaDeAutores() = libros.map({l => l.nombreDeAutor()}).asSet()
	method sonTodosDelMismoAutor() = self.listaDeAutores() == 1
	override method sirveParaBroncearse() = false
	override method esRecomendadaParaSocio(unSocio) = unSocio.cantidadDeIdiomasQueHabla() > 1
	
}

class Libro {
	const property idioma
	const property paginas
	const property nombreDeAutor
}