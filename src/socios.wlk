class Socio {
	const actividadesRealizadas = #{}
	const maximoDeActividades
	const property edad
	const idiomasQueHabla = #{}
	
	method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})
	method realizarActividad(unaActividad) {
		if (self.cantidadDeActividades() >= maximoDeActividades){
			self.error("Ya alcanzo el maximo de actividades")
		}
		actividadesRealizadas.add(unaActividad)
	}
	method cantidadDeActividades() = actividadesRealizadas.size()
	method estaActividadEnLista(unaActividad) = actividadesRealizadas.contains(unaActividad)
	method cantidadDeIdiomasQueHabla() = idiomasQueHabla.size()
}

class SocioTranquilo inherits Socio {
	 method leAtraeActividad(unaActividad) = unaActividad.diasQueLleva() >= 4
}

class SocioCoherente inherits Socio {
	 method leAtraeActividad(unaActividad){
		if (self.esAdoradorDelSol())
			return unaActividad.sirveParaBroncearse()
		else
			return unaActividad.implicaEsfuerzo()
	}
}

class SocioRelajado inherits Socio {
	 method leAtraeActividad(unaActividad) = not idiomasQueHabla.intersection(unaActividad.idiomas()).isEmpty()
}