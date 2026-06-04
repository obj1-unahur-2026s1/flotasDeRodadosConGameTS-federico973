class Corsa {
  var color
  method capacidad() = 4
  method velocidad() = 150
  method peso() = 1300
  method pintar(unColor) {color=unColor}
  method color() = color 
}

class Kwid{
    var tieneTanqueAdicional
    method agregarTanqueAdicional() {tieneTanqueAdicional = true}
    method quitarTanqueAdicional() {tieneTanqueAdicional = false}
    method color() = "azul"
    method capacidad() = if(tieneTanqueAdicional) 3 else 4
    method velocidad() = if(tieneTanqueAdicional) 120 else 110
    method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
}

object trafic {
  var interior = comodo
  var motor = pulenta

  method cambiarMotor(unMotor) {motor = unMotor}
  method cambiarInterior(unInterior) {interior = unInterior}
  method peso() = interior.peso() + motor.peso() + 4000
  method capacidad() = interior.capacidad()
  method velocidada() = motor.velocidad()
  method color() = "blanco"
  }

object comodo{
  method capacidad() = 5
  method peso() = 700
}
object popular{
  method capacidad() = 12
  method peso() = 1000
}

object pulenta{
  method peso() = 800
  method velocidad() = 130
}
object bataton{
  method peso() = 500
  method velocidad() = 80
}

class AutoEspecial{
    var color
    const capacidad
    const velocidad
    const peso
    method velocidad() = velocidad
    method peso() = peso
    method capacidad() = capacidad
    method pintar(unColor) {color = unColor}
    method color() = color
}

class Dependencia{
    const flota = #{}
    const empleados
    const pedidos = #{}
    method flota() = flota
    method empleados() = empleados
    method agregarAFlota(rodado) = flota.add(rodado)
    method quitarDeFlota(rodado) = flota.remove(rodado)
    method pesoTotalFlota() = flota.sum({f => f.peso()})
    method estaBienEquipada() = flota.size() < 2 && self.todosVanAlmenos(100)
    method todosVanAlmenos(unaVelocidad) = flota.all({f => f.velocidad() >= unaVelocidad})
    method capadidadTotalEnColor(color) = self.flotaDeColor(color).sum({f => f.capacidad()})
    method flotaDeColor(unColor) = flota.filter({f => f.color() == unColor})
    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
    method rodadoMasRapido() = flota.max({f => f.velocidad()})
    method capacidadFaltante() = (empleados - self.capacidadFlota()).max(0)
    method capacidadFlota() = flota.sum({f => f.capacidad()})
    method esGrande() {empleados >= 40 and flota.size() >= 5}

    method totalPasajerosDePedido() = pedidos.sum({p=>p.cantidadDePasajeros()})
    method algunAutoSatisface(unPedido) = flota.any({f=>unPedido.puedeSatisfacerlo(f)})
    method quePedidosNoPuedenSerSatisfechosPorNingunAuto(){
      pedidos.filter({p=>!self.algunAutoSatisface(p)})
    }

}

class Pedido{
  const distancia
  var tiempoMaximo
  var cantidadPasajeros
  const coloresIncompatibles = #{}
  method agregarColorIncompatible(unColor) = coloresIncompatibles.add(unColor)
  method velocidadRequerida() = distancia.div(tiempoMaximo)
  method puedeSatisfacerlo(unAuto) {
    return unAuto.velocidad() >= self.velocidadRequerida() + 10 and 
    unAuto.capacidad() >= cantidadPasajeros and 
    !coloresIncompatibles.contains(unAuto.color())}
  method cantidadDePasajeros() = cantidadPasajeros

  }
