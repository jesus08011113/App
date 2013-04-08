package servicios

class TipoObservacion {
    String nombre
    String tipo
   

    static constraints = {
        nombre nullable:false
         tipo inList:["Proyecto","Orden Servicio"], nullable:false, blank:false
    }
       public String toString() {
        nombre
         
    
    }
}
